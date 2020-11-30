FROM ubuntu:18.04 as build
RUN apt update && apt install git maven default-jdk -y
WORKDIR /tmp/
RUN git clone https://github.com/boxfuse/boxfuse-sample-java-war-hello.git
RUN mvn package -f /tmp/boxfuse-sample-java-war-hello/pom.xml

FROM tomcat:9.0.20-jre8-alpine
COPY --from=build /tmp/boxfuse-sample-java-war-hello/pom.xml /usr/local/tomcat/webapps/
