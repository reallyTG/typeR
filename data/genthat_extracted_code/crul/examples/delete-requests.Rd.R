library(crul)


### Name: delete-requests
### Title: HTTP DELETE requests
### Aliases: delete-requests

### ** Examples

## Not run: 
##D (x <- HttpClient$new(url = "https://httpbin.org"))
##D 
##D ## a list
##D (res1 <- x$delete('delete', body = list(hello = "world"), verbose = TRUE))
##D jsonlite::fromJSON(res1$parse("UTF-8"))
##D 
##D ## a string
##D (res2 <- x$delete('delete', body = "hello world", verbose = TRUE))
##D jsonlite::fromJSON(res2$parse("UTF-8"))
##D 
##D ## empty body request
##D x$delete('delete', verbose = TRUE)
## End(Not run)



