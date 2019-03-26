library(crul)


### Name: HttpResponse
### Title: Base response object
### Aliases: HttpResponse
### Keywords: datasets

### ** Examples

## Not run: 
##D x <- HttpResponse$new(method = "get", url = "https://httpbin.org")
##D x$url
##D x$method
##D 
##D x <- HttpClient$new(url = 'https://httpbin.org')
##D (res <- x$get('get'))
##D res$request_headers
##D res$response_headers
##D res$parse()
##D res$status_code
##D res$status_http()
##D res$status_http()$status_code
##D res$status_http()$message
##D res$status_http()$explanation
##D res$success()
##D 
##D x <- HttpClient$new(url = 'https://httpbin.org/status/404')
##D (res <- x$get())
##D # res$raise_for_status()
##D 
##D x <- HttpClient$new(url = 'https://httpbin.org/status/414')
##D (res <- x$get())
##D # res$raise_for_status()
## End(Not run)



