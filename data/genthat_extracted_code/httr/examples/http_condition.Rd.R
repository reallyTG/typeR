library(httr)


### Name: http_condition
### Title: Generate a classed http condition.
### Aliases: http_condition
### Keywords: internal

### ** Examples

# You can use tryCatch to take different actions based on the type
# of error. Note that tryCatch will call the first handler that
# matches any classes of the condition, not the best matching, so
# always list handlers from most specific to least specific
f <- function(url) {
  tryCatch(stop_for_status(GET(url)),
    http_404 = function(c) "That url doesn't exist",
    http_403 = function(c) "You need to authenticate!",
    http_400 = function(c) "You made a mistake!",
    http_500 = function(c) "The server screwed up"
  )
}
f("http://httpbin.org/status/404")
f("http://httpbin.org/status/403")
f("http://httpbin.org/status/505")



