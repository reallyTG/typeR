library(httr)


### Name: RETRY
### Title: Retry a request until it succeeds.
### Aliases: RETRY

### ** Examples

# Succeeds straight away
RETRY("GET", "http://httpbin.org/status/200")
# Never succeeds
RETRY("GET", "http://httpbin.org/status/500")
## No test: 
# Invalid hostname generates curl error condition and is retried but eventually
# raises an error condition.
RETRY("GET", "http://invalidhostname/")
## End(No test)



