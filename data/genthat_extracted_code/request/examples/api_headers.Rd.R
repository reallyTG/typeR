library(request)


### Name: api_headers
### Title: Headers
### Aliases: api_headers api_headers_

### ** Examples

## Not run: 
##D api('https://api.github.com/') %>%
##D    api_config(verbose()) %>%
##D    api_headers(`X-FARGO-SEASON` = 3) %>%
##D    peep
##D 
##D api('http://httpbin.org/headers') %>%
##D    api_headers(`X-FARGO-SEASON` = 3, `X-NARCOS-SEASON` = 5)
## End(Not run)



