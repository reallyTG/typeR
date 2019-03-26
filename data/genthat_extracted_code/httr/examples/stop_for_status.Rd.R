library(httr)


### Name: stop_for_status
### Title: Take action on http error.
### Aliases: stop_for_status warn_for_status message_for_status

### ** Examples

x <- GET("http://httpbin.org/status/200")
stop_for_status(x) # nothing happens
warn_for_status(x)
message_for_status(x)

x <- GET("http://httpbin.org/status/300")
## Not run: 
##D stop_for_status(x)
## End(Not run)
warn_for_status(x)
message_for_status(x)

x <- GET("http://httpbin.org/status/404")
## Not run: 
##D stop_for_status(x)
## End(Not run)
warn_for_status(x)
message_for_status(x)

# You can provide more information with the task argument
warn_for_status(x, "download spreadsheet")
message_for_status(x, "download spreadsheet")



