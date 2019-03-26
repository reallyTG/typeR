library(vcr)


### Name: HTTPInteraction
### Title: HTTPInteraction class
### Aliases: HTTPInteraction
### Keywords: datasets

### ** Examples

## Not run: 
##D # make the request
##D library(vcr)
##D url <- "https://eu.httpbin.org/post"
##D body <- list(foo = "bar")
##D cli <- crul::HttpClient$new(url = url)
##D res <- cli$post(body = body)
##D 
##D # build a Request object
##D (request <- Request$new("POST", uri = url,
##D   body = body, headers = res$response_headers))
##D # build a VcrResponse object
##D (response <- VcrResponse$new(
##D    res$status_http(),
##D    res$response_headers,
##D    res$parse("UTF-8"),
##D    res$response_headers$status))
##D 
##D # make HTTPInteraction object
##D (x <- HTTPInteraction$new(request = request, response = response))
##D x$recorded_at
##D x$to_hash()
##D 
##D # make an HTTPInteraction from a hash with the object already made
##D x$from_hash(x$to_hash())
##D 
##D # Make an HTTPInteraction from a hash alone
##D my_hash <- x$to_hash()
##D HTTPInteraction$new()$from_hash(my_hash)
## End(Not run)



