library(webmockr)


### Name: Response
### Title: Response class
### Aliases: Response
### Keywords: datasets

### ** Examples

## Not run: 
##D (x <- Response$new())
##D 
##D x$set_url("https://httpbin.org/get")
##D x
##D 
##D x$set_request_headers(list('Content-Type' = "application/json"))
##D x
##D x$request_headers
##D 
##D x$set_response_headers(list('Host' = "httpbin.org"))
##D x
##D x$response_headers
##D 
##D x$set_status(404)
##D x
##D x$get_status()
##D 
##D x$set_body("hello world")
##D x
##D x$get_body()
##D 
##D x$set_exception("exception")
##D x
##D x$get_exception()
## End(Not run)



