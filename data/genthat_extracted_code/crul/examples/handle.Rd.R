library(crul)


### Name: handle
### Title: Make a handle
### Aliases: handle

### ** Examples

handle("https://httpbin.org")

# handles - pass in your own handle
## Not run: 
##D h <- handle("https://httpbin.org")
##D (res <- HttpClient$new(handle = h))
##D out <- res$get("get")
## End(Not run)



