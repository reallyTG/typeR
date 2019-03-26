library(splashr)


### Name: splash_html
### Title: Return a HTML snapshot of a current page.
### Aliases: splash_html

### ** Examples

## Not run: 
##D splash_local %>%
##D   splash_response_body(TRUE) %>%
##D   splash_user_agent(ua_macos_chrome) %>%
##D   splash_go("https://rud.is/b") %>%
##D   splash_wait(2) %>%
##D   splash_html() -> rud_pg
## End(Not run)



