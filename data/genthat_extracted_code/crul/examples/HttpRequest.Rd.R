library(crul)


### Name: HttpRequest
### Title: HTTP request object
### Aliases: HttpRequest
### Keywords: datasets

### ** Examples

## Not run: 
##D x <- HttpRequest$new(url = "https://httpbin.org/get")
##D ## note here how the HTTP method is shown on the first line to the right
##D x$get()
##D 
##D ## assign to a new object to keep the output
##D z <- x$get()
##D ### get the HTTP method
##D z$method()
##D 
##D (x <- HttpRequest$new(url = "https://httpbin.org/get")$get())
##D x$url
##D x$payload
##D 
##D (x <- HttpRequest$new(url = "https://httpbin.org/post"))
##D x$post(body = list(foo = "bar"))
##D 
##D HttpRequest$new(
##D   url = "https://httpbin.org/get",
##D   headers = list(
##D     `Content-Type` = "application/json"
##D   )
##D )
##D 
##D # verb: get any http method
##D z <- HttpRequest$new(url = "https://httpbin.org/get")
##D res <- z$verb('get', query = list(hello = "world"))
##D res$payload
## End(Not run)



