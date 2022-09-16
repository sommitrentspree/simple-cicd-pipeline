FROM golang:1.19.1-alpine3.16 as builder

WORKDIR /app

COPY . .

RUN go build -o app

FROM alpine:3.16

WORKDIR /bin

COPY --from=builder /app/app /bin/app

CMD ["/bin/app"]

