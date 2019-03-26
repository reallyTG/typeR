library(webmockr)


### Name: RequestPattern
### Title: RequestPattern class
### Aliases: RequestPattern
### Keywords: datasets

### ** Examples

## Not run: 
##D (x <- RequestPattern$new(method = "get", uri = "https://httpbin.org/get"))
##D x$body_pattern
##D x$headers_pattern
##D x$method_pattern
##D x$uri_pattern
##D x$to_s()
##D 
##D # make a request signature
##D rs <- RequestSignature$new(method = "get", uri = "https://httpbin.org/get")
##D 
##D # check if it matches
##D x$matches(rs)
##D 
##D # regex uri
##D (x <- RequestPattern$new(method = "get", uri_regex = ".+ossref.org"))
##D x$uri_pattern
##D x$uri_pattern$to_s()
##D x$to_s()
##D 
##D # uri with query parameters
##D (x <- RequestPattern$new(
##D     method = "get", uri = "https://httpbin.org/get",
##D     query = list(foo = "bar")
##D ))
##D x$to_s()
## End(Not run)



