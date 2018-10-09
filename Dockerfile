FROM golang:1.10.3
MAINTAINER Peter Linde <plinde@gmail.com>

RUN set -x && \
    apt-get update && \
    apt-get upgrade -y && \
    apt-get clean && \
    mkdir /app

ADD ./mqttbeat /app
ADD ./mqttbeat.yml /app
RUN chmod go-w /app/mqttbeat.yml
WORKDIR /app

CMD ["/app/mqttbeat","-c","/app/mqttbeat.yml"]
# CMD ["/app/mqttbeat","-c","/app/mqttbeat.yml","-e"]
