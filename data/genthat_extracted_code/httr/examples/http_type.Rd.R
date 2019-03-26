library(httr)


### Name: http_type
### Title: Extract the content type of a response
### Aliases: http_type

### ** Examples

r1 <- GET("http://httpbin.org/image/png")
http_type(r1)
headers(r1)[["Content-Type"]]

r2 <- GET("http://httpbin.org/ip")
http_type(r2)
headers(r2)[["Content-Type"]]



