library(crul)


### Name: AsyncVaried
### Title: Async client for different request types
### Aliases: AsyncVaried
### Keywords: datasets

### ** Examples

## Not run: 
##D # pass in requests via ...
##D req1 <- HttpRequest$new(
##D   url = "https://httpbin.org/get",
##D   opts = list(verbose = TRUE),
##D   headers = list(foo = "bar")
##D )$get()
##D req2 <- HttpRequest$new(url = "https://httpbin.org/post")$post()
##D 
##D # Create an AsyncVaried object
##D out <- AsyncVaried$new(req1, req2)
##D 
##D # before you make requests, the methods return empty objects
##D out$status()
##D out$status_code()
##D out$content()
##D out$times()
##D out$parse()
##D out$responses()
##D 
##D # make requests
##D out$request()
##D 
##D # access various parts
##D ## http status objects
##D out$status()
##D ## status codes
##D out$status_code()
##D ## content (raw data)
##D out$content()
##D ## times
##D out$times()
##D ## parsed content
##D out$parse()
##D ## response objects
##D out$responses()
##D 
##D # use $verb() method to select http verb
##D method <- "post"
##D req1 <- HttpRequest$new(
##D   url = "https://httpbin.org/post",
##D   opts = list(verbose = TRUE),
##D   headers = list(foo = "bar")
##D )$verb(method)
##D req2 <- HttpRequest$new(url = "https://httpbin.org/post")$verb(method)
##D out <- AsyncVaried$new(req1, req2)
##D out
##D out$request()
##D out$responses()
##D 
##D # pass in requests in a list via .list param
##D reqlist <- list(
##D   HttpRequest$new(url = "https://httpbin.org/get")$get(),
##D   HttpRequest$new(url = "https://httpbin.org/post")$post(),
##D   HttpRequest$new(url = "https://httpbin.org/put")$put(),
##D   HttpRequest$new(url = "https://httpbin.org/delete")$delete(),
##D   HttpRequest$new(url = "https://httpbin.org/get?g=5")$get(),
##D   HttpRequest$new(
##D     url = "https://httpbin.org/post")$post(body = list(y = 9)),
##D   HttpRequest$new(
##D     url = "https://httpbin.org/get")$get(query = list(hello = "world"))
##D )
##D 
##D out <- AsyncVaried$new(.list = reqlist)
##D out$request()
##D out$status()
##D out$status_code()
##D out$content()
##D out$times()
##D out$parse()
##D 
##D # using auth with async
##D url <- "https://httpbin.org/basic-auth/user/passwd"
##D auth <- auth(user = "user", pwd = "passwd")
##D reqlist <- list(
##D   HttpRequest$new(url = url, auth = auth)$get(),
##D   HttpRequest$new(url = url, auth = auth)$get(query = list(a=5)),
##D   HttpRequest$new(url = url, auth = auth)$get(query = list(b=3))
##D )
##D out <- AsyncVaried$new(.list = reqlist)
##D out$request()
##D out$status()
##D out$parse()
##D 
##D # failure behavior
##D ## e.g. when a URL doesn't exist, a timeout, etc.
##D reqlist <- list(
##D   HttpRequest$new(url = "http://stuffthings.gvb")$get(),
##D   HttpRequest$new(url = "https://httpbin.org")$head(),
##D   HttpRequest$new(url = "https://httpbin.org", 
##D    opts = list(timeout_ms = 10))$head()
##D )
##D (tmp <- AsyncVaried$new(.list = reqlist))
##D tmp$request()
##D tmp$responses()
##D tmp$parse("UTF-8")
##D 
##D # access intemediate redirect headers
##D dois <- c("10.7202/1045307ar", "10.1242/jeb.088898", "10.1121/1.3383963")
##D reqlist <- list(
##D   HttpRequest$new(url = paste0("https://doi.org/", dois[1]))$get(),
##D   HttpRequest$new(url = paste0("https://doi.org/", dois[2]))$get(),
##D   HttpRequest$new(url = paste0("https://doi.org/", dois[3]))$get()
##D )
##D tmp <- AsyncVaried$new(.list = reqlist)
##D tmp$request()
##D tmp
##D lapply(tmp$responses(), "[[", "response_headers_all")
## End(Not run)



