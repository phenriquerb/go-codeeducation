FROM golang:1.17 AS Builder

RUN mkdir /app

ADD . /app

WORKDIR /app

RUN go mod init example/hello

RUN go build -o hello .

FROM scratch

WORKDIR /app

COPY --from=Builder /app/hello .

CMD ["/app/hello"]