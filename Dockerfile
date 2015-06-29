FROM ruby:2.0.0
MAINTAINER Sean McQuillan <sean@remind101.com>

LABEL app r101-projectmonitor

RUN bundle config --global frozen 1

RUN mkdir -p /usr/src/app
WORKDIR /usr/src/app

COPY Gemfile /usr/src/app/
COPY Gemfile.lock /usr/src/app/
RUN bundle install --without development test

COPY . /usr/src/app

CMD ["./bin/web"]
