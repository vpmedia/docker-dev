#!/usr/bin/env bash
# CLI Project Helper
# Copyright (c) 2023-present VPMedia
# author: Andras Csizmadia <andras@vpmedia.hu>

set -e

task_help() {
  echo "-h or --help = Show this help"
  echo "--start-mongo = Start Mongo db container"
  echo "--start-mysql = Start MySQL db container"
  echo "--start-otel = Start OpenTelemetry containers"
  echo "--start-redis = Start Redis db container"
}

task_docker_mongo() {
  docker compose --file docker-compose-mongo.yml down
  docker compose --file docker-compose-mongo.yml up --build --remove-orphans
}

task_docker_mysql() {
  docker compose --file docker-compose-mysql.yml down
  docker compose --file docker-compose-mysql.yml up --build --remove-orphans
}

task_docker_otel() {
  docker compose --file docker-compose-otel.yml down
  docker compose --file docker-compose-otel.yml up --build --remove-orphans
}

task_docker_redis() {
  docker compose --file docker-compose-redis.yml down
  docker compose --file docker-compose-redis.yml up --build --remove-orphans
}

case "$1" in
  -h|--help)
  task_help
  ;;
  --start-mongo)
  task_docker_mongo "$2"
  ;;
  --start-mysql)
  task_docker_mysql "$2"
  ;;
  --start-otel)
  task_docker_otel "$2"
  ;;
  --start-redis)
  task_docker_redis "$2"
  ;;
 *)
  task_help
  ;;
esac
