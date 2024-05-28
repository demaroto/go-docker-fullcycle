FROM golang:1.22 as Builder

WORKDIR /usr/src/app

RUN go mod init wildemarbarbosa/go-app
RUN go mod download && go mod verify

COPY . .
RUN go build -v -o /usr/local/bin/app ./

FROM hello-world:linux

COPY --from=Builder /usr/local/bin/app /

CMD ["/app"]