library(splashr)


### Name: as_response
### Title: Return a HAR entry response as an httr::response object
### Aliases: as_response

### ** Examples

## Not run: 
##D library(purrr)
##D 
##D URL <- "http://www.svs.cl/portal/principal/605/w3-propertyvalue-18554.html"
##D 
##D splash_local %>%
##D   splash_response_body(TRUE) %>%
##D   splash_user_agent(ua_macos_chrome) %>%
##D   splash_go(URL) %>%
##D   splash_wait(2) %>%
##D   splash_har() -> har
##D 
##D keep(har$log$entries, is_xhr) %>%
##D   map(as_request) %>%
##D   map(httr::content, as="parsed")
## End(Not run)



