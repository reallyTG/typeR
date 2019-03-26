library(request)


### Name: request-package
### Title: Easy http
### Aliases: request request-package
### Keywords: package

### ** Examples

## Not run: 
##D ## Build API routes
##D ### Works with full or partial URLs
##D api('https://api.github.com/')
##D api('http://api.gbif.org/v1')
##D api('api.gbif.org/v1')
##D 
##D ### Works with ports, full or partial
##D api('http://localhost:9200')
##D api('localhost:9200')
##D api(':9200')
##D api('9200')
##D 
##D ## The above are not passed through a pipe, so simply define a URL, but don't
##D ## do a request. To make an http request, you can either pipe a url or
##D ## partial url to e.g., \code{api}, or call \code{http}
##D 'https://api.github.com/' %>% api()
##D ### Or
##D api('https://api.github.com/') %>% http()
##D 
##D # Non-standard evaluation (NSE)
##D api('https://api.github.com/') %>%
##D   api_path(repos, ropensci, rgbif, issues) %>%
##D   peep
##D 
##D # Standard evaluation (SE)
##D api('https://api.github.com/') %>%
##D   api_path_('repos', 'ropensci', 'rgbif', 'issues') %>%
##D   peep
##D 
##D ## Templating
##D repo_info <- list(username = 'craigcitro', repo = 'r-travis')
##D api('https://api.github.com/') %>%
##D   api_template(template = 'repos/{{username}}/{{repo}}/issues', data = repo_info) %>%
##D   peep
## End(Not run)



