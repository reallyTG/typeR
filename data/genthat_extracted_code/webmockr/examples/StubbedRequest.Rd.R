library(webmockr)


### Name: StubbedRequest
### Title: StubbedRequest class
### Aliases: StubbedRequest
### Keywords: datasets

### ** Examples

## Not run: 
##D x <- StubbedRequest$new(method = "get", uri = "api.crossref.org")
##D x$method
##D x$uri
##D x$with(headers = list('User-Agent' = 'R'))
##D x$to_return(status = 200, body = "foobar", headers = list(a = 5))
##D x
##D x$to_s()
##D 
##D # uri_regex
##D (x <- StubbedRequest$new(method = "get", uri_regex = ".+ossref.org"))
##D x$method
##D x$uri
##D x$to_s()
##D 
##D (x <- StubbedRequest$new(method = "get", uri_regex = ".+ossref.org"))
##D x$to_s()
##D x$timeout <- TRUE
##D x$to_s()
## End(Not run)



