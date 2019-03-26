library(crul)


### Name: writing-options
### Title: Writing data options
### Aliases: writing-options

### ** Examples

## Not run: 
##D # write to disk
##D (x <- HttpClient$new(url = "https://httpbin.org"))
##D f <- tempfile()
##D res <- x$get("get", disk = f)
##D res$content # when using write to disk, content is a path
##D readLines(res$content)
##D close(file(f))
##D 
##D # streaming response
##D (x <- HttpClient$new(url = "https://httpbin.org"))
##D res <- x$get('stream/50', stream = function(x) cat(rawToChar(x)))
##D res$content # when streaming, content is NULL
##D 
##D 
##D ## Async
##D (cc <- Async$new(
##D   urls = c(
##D     'https://httpbin.org/get?a=5',
##D     'https://httpbin.org/get?foo=bar',
##D     'https://httpbin.org/get?b=4',
##D     'https://httpbin.org/get?stuff=things',
##D     'https://httpbin.org/get?b=4&g=7&u=9&z=1'
##D   )
##D ))
##D files <- replicate(5, tempfile())
##D (res <- cc$get(disk = files, verbose = TRUE))
##D lapply(files, readLines)
##D 
##D ## Async varied
##D ### disk
##D f <- tempfile()
##D g <- tempfile()
##D req1 <- HttpRequest$new(url = "https://httpbin.org/get")$get(disk = f)
##D req2 <- HttpRequest$new(url = "https://httpbin.org/post")$post(disk = g)
##D req3 <- HttpRequest$new(url = "https://httpbin.org/get")$get()
##D (out <- AsyncVaried$new(req1, req2, req3))
##D out$request()
##D out$content()
##D readLines(f)
##D readLines(g)
##D close(file(f))
##D close(file(g))
##D 
##D ### stream - to console
##D fun <- function(x) cat(rawToChar(x))
##D req1 <- HttpRequest$new(url = "https://httpbin.org/get"
##D )$get(query = list(foo = "bar"), stream = fun)
##D req2 <- HttpRequest$new(url = "https://httpbin.org/get"
##D )$get(query = list(hello = "world"), stream = fun)
##D (out <- AsyncVaried$new(req1, req2))
##D out$request()
##D out$content()
##D 
##D ### stream - to an R object
##D lst <- c()
##D fun <- function(x) lst <<- c(lst, x)
##D req1 <- HttpRequest$new(url = "https://httpbin.org/get"
##D )$get(query = list(foo = "bar"), stream = fun)
##D req2 <- HttpRequest$new(url = "https://httpbin.org/get"
##D )$get(query = list(hello = "world"), stream = fun)
##D (out <- AsyncVaried$new(req1, req2))
##D out$request()
##D lst
##D cat(rawToChar(lst))
## End(Not run)



