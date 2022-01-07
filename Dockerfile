FROM python:3.9-alpine

ENV PYTHONUNBUFFERED 1

# Install dependencies
COPY ./requirements.txt /requirements.txt
RUN pip install -r /requirements.txt

# Setup directory structure
RUN mkdir /app
RUN chown -R $(whoami):$(whoami) app/
WORKDIR /app
COPY ./app/ /app

RUN adduser -D user
USER user