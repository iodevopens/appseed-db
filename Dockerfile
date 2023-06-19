FROM alpine:latest

WORKDIR /app
VOLUME /app

RUN apk add --update mysql mysql-client && rm -f /var/cache/apk/*

ENV MYSQL_ROOT_PASSWORD=iodevopens \
    MYSQL_USER=iodevopens \
    MYSQL_PASSWORD=iodevopens \
    MYSQL_DATABASE=iodevopens 

COPY startup.sh /startup.sh
COPY my.cnf /etc/mysql/my.cnf

EXPOSE 3306

CMD ["/startup.sh"]
