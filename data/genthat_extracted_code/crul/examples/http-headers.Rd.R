library(crul)


### Name: http-headers
### Title: Working with HTTP headers
### Aliases: http-headers

### ** Examples

## Not run: 
##D (x <- HttpClient$new(url = "https://httpbin.org"))
##D 
##D # set headers
##D (res <- HttpClient$new(
##D   url = "https://httpbin.org",
##D   opts = list(
##D     verbose = TRUE
##D   ),
##D   headers = list(
##D     a = "stuff",
##D     b = "things"
##D   )
##D ))
##D res$headers
##D # reassign header value
##D res$headers$a <- "that"
##D # define new header
##D res$headers$c <- "what"
##D # request
##D res$get('get')
##D 
##D ## setting content-type via headers
##D (res <- HttpClient$new(
##D   url = "https://httpbin.org",
##D   opts = list(
##D     verbose = TRUE
##D   ),
##D   headers = list(`Content-Type` = "application/json")
##D ))
##D res$get('get')
## End(Not run)



