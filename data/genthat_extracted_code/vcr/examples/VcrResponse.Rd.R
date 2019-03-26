library(vcr)


### Name: VcrResponse
### Title: The response of an HTTPInteraction
### Aliases: VcrResponse
### Keywords: internal

### ** Examples

## Not run: 
##D vcr_configure(dir = tempdir())
##D 
##D 
##D url <- "https://google.com"
##D (cli <- crul::HttpClient$new(url = url))
##D (res <- cli$get("get", query = list(q = "stuff")))
##D (x <- VcrResponse$new(res$status_http(), res$response_headers,
##D    res$parse("UTF-8"), res$response_headers$status))
##D x$body
##D x$status
##D x$headers
##D x$http_version
##D x$to_hash()
##D x$from_hash(x$to_hash())
##D 
##D 
##D # update content length header
##D ## example 1
##D ### content-length header present, but no change
##D url <- "https://fishbase.ropensci.org"
##D cli <- crul::HttpClient$new(url = url, headers = list(`Accept-Encoding` = '*'))
##D res <- cli$get("species/34")
##D x <- VcrResponse$new(res$status_http(), res$response_headers,
##D    res$parse("UTF-8"), res$response_headers$status)
##D x$headers$`content-length`
##D x$update_content_length_header()
##D x$headers$`content-length`
##D 
##D ## example 2
##D ### no content-length header
##D url <- "https://google.com"
##D cli <- crul::HttpClient$new(url = url)
##D res <- cli$get()
##D x <- VcrResponse$new(res$status_http(), res$response_headers,
##D    rawToChar(res$content), res$response_headers$status)
##D x$headers$`content-length`
##D x$update_content_length_header() # no change, b/c header doesn't exist
##D 
##D 
##D # check if body is compressed
##D url <- "https://fishbase.ropensci.org"
##D (cli <- crul::HttpClient$new(url = url))
##D (res <- cli$get("species/3"))
##D res$response_headers
##D (x <- VcrResponse$new(res$status_http(), res$response_headers,
##D    res$parse("UTF-8"), res$response_headers$status))
##D x$content_encoding()
##D x$is_compressed()
## End(Not run)



