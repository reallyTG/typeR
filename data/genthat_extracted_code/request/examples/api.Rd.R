library(request)


### Name: api
### Title: API base url and endpoint setup
### Aliases: api api_path api_path_ api_template

### ** Examples

## Not run: 
##D # Set base url
##D ## works with full or partial URLs
##D api('https://api.github.com/')
##D api('http://api.gbif.org/v1')
##D api('api.gbif.org/v1')
##D 
##D ## works with ports, full or partial
##D api('http://localhost:9200')
##D api('localhost:9200')
##D api(':9200')
##D api('9200')
##D api('9200/stuff')
##D 
##D # set paths
##D ## NSE
##D api('https://api.github.com/') %>%
##D   api_path(repos, ropensci, rgbif, issues)
##D ## SE
##D api('https://api.github.com/') %>%
##D   api_path_('repos', 'ropensci', 'rgbif', 'issues')
##D 
##D # template
##D repo_info <- list(username = 'craigcitro', repo = 'r-travis')
##D api('https://api.github.com/') %>%
##D   api_template(template = 'repos/{{username}}/{{repo}}/issues', data = repo_info)
## End(Not run)



