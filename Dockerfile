FROM openjdk:8-jdk-alpine
EXPOSE 8000
ARG P_HOST_MS_GATEWAYBIO
COPY msapibioext-0.0.1-SNAPSHOT.jar app.jar
ENV HOST_MS_GATEWAYBIO=${P_HOST_MS_GATEWAYBIO}
RUN apk add --no-cache tzdata
RUN cp /usr/share/zoneinfo/America/Bogota /etc/localtime
RUN echo "America/Bogota" > /etc/timezone
ENTRYPOINT ["java","-Djava.security.egd=file:/dev/./urandom","-jar","/app.jar"]
