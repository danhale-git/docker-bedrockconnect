FROM ubuntu:18.04

RUN apt update \
    && apt install -y openjdk-8-jre-headless 

RUN apt install -y wget \
    && wget https://github.com/Pugmatt/BedrockConnect/releases/download/1.6.2/BedrockConnect-1.0-SNAPSHOT.jar

COPY install-bind.sh /

COPY custom_servers.json /

RUN /install-bind.sh <your_IP> <your_IP>

ENTRYPOINT  java -jar BedrockConnect-1.0-SNAPSHOT.jar \
            nodb=true \
            custom_servers=/custom_servers.json