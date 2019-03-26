library(httr)


### Name: http_status
### Title: Give information on the status of a request.
### Aliases: http_status

### ** Examples

http_status(100)
http_status(404)

x <- GET("http://httpbin.org/status/200")
http_status(x)

http_status(GET("http://httpbin.org/status/300"))
http_status(GET("http://httpbin.org/status/301"))
http_status(GET("http://httpbin.org/status/404"))

# errors out on unknown status
## Not run: 
##D http_status(GET("http://httpbin.org/status/320"))
## End(Not run)



