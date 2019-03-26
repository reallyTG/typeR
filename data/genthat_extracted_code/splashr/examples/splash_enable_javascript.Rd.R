library(splashr)


### Name: splash_enable_javascript
### Title: Enable or disable execution of JavaSript code embedded in the
###   page.
### Aliases: splash_enable_javascript

### ** Examples

## Not run: 
##D splash_local %>%
##D   splash_response_body(TRUE) %>%
##D   splash_private_mode(TRUE) %>%
##D   splash_enable_javascript(FALSE) %>%
##D   splash_user_agent(ua_macos_chrome) %>%
##D   splash_go("https://rud.is/b") %>%
##D   splash_wait(2) %>%
##D   splash_har() -> rud_har
## End(Not run)



