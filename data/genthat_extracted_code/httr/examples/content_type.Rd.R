library(httr)


### Name: content_type
### Title: Set content-type and accept headers.
### Aliases: content_type content_type_json content_type_xml accept
###   accept_json accept_xml

### ** Examples

GET("http://httpbin.org/headers")

GET("http://httpbin.org/headers", accept_json())
GET("http://httpbin.org/headers", accept("text/csv"))
GET("http://httpbin.org/headers", accept(".doc"))

GET("http://httpbin.org/headers", content_type_xml())
GET("http://httpbin.org/headers", content_type("text/csv"))
GET("http://httpbin.org/headers", content_type(".xml"))



