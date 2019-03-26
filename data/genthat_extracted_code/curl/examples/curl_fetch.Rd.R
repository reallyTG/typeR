library(curl)


### Name: curl_fetch_memory
### Title: Fetch the contents of a URL
### Aliases: curl_fetch_memory curl_fetch_disk curl_fetch_stream
###   curl_fetch_multi curl_fetch_echo

### ** Examples

# Load in memory
res <- curl_fetch_memory("http://httpbin.org/cookies/set?foo=123&bar=ftw")
res$content

# Save to disk
res <- curl_fetch_disk("http://httpbin.org/stream/10", tempfile())
res$content
readLines(res$content)

# Stream with callback
res <- curl_fetch_stream("http://www.httpbin.org/drip?duration=5&numbytes=15&code=200", function(x){
  cat(rawToChar(x))
})

# Async API
data <- list()
success <- function(res){
  cat("Request done! Status:", res$status, "\n")
  data <<- c(data, list(res))
}
failure <- function(msg){
  cat("Oh noes! Request failed!", msg, "\n")
}
curl_fetch_multi("http://httpbin.org/get", success, failure)
curl_fetch_multi("http://httpbin.org/status/418", success, failure)
curl_fetch_multi("https://urldoesnotexist.xyz", success, failure)
multi_run()
str(data)



