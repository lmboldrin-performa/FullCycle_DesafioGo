FROM golang:1.21-alpine3.18 as build

COPY /src /src
WORKDIR /go
RUN go build /src/main.go

FROM scratch
WORKDIR /go
COPY --from=build /go .
CMD ["./main"]