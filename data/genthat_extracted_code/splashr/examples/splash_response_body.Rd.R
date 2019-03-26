library(splashr)


### Name: splash_response_body
### Title: Enable or disable response content tracking.
### Aliases: splash_response_body

### ** Examples

## Not run: 
##D splash_local %>%
##D   splash_response_body(TRUE) %>%
##D   splash_user_agent(ua_macos_chrome) %>%
##D   splash_go("https://rud.is/b") %>%
##D   splash_wait(2) %>%
##D   splash_har() -> rud_har
## End(Not run)



