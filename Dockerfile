FROM alpine:latest
MAINTAINER guangjie <guangjie@gjie.cn>
WORKDIR /root
ADD jdk1.8.0_202 /usr/local/java
RUN ln -sf /usr/share/zoneinfo/Asia/Shanghai /etc/localtime
RUN echo 'Asia/Shanghai' >/etc/timezone
RUN apk --no-cache add ca-certificates wget && \
wget -q -O /etc/apk/keys/sgerrand.rsa.pub https://alpine-pkgs.sgerrand.com/sgerrand.rsa.pub && \
wget https://github.com/sgerrand/alpine-pkg-glibc/releases/download/2.31-r0/glibc-2.31-r0.apk && \
apk add glibc-2.31-r0.apk
ENV JAVA_HOME /usr/local/java
ENV CLASSPATH .:$JAVA_HOME/lib:$JRE_HOME/lib:$CLASSPATH
ENV PATH $PATH:$JAVA_HOME/bin:$JRE_HOME/bin
