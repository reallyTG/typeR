library(request)


### Name: http
### Title: Make a HTTP request
### Aliases: http http_client

### ** Examples

## Not run: 
##D # high level - http()
##D api('https://api.github.com/') %>%
##D   api_path(repos, ropensci, rgbif, commits) %>%
##D   http()
##D 
##D # low level - http_client()
##D res <- api('https://api.github.com/') %>%
##D   api_path(repos, ropensci, rgbif, commits) %>%
##D   http_client()
##D res$count()
##D res$body()
##D res$status()
##D res$result
##D res$links
##D res$parse()
##D 
##D # Specify HTTP verb
##D api("http://httpbin.org/post") %>%
##D    api_body(x = "A simple text string") %>%
##D    http("POST")
## End(Not run)



