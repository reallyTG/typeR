library(request)


### Name: peep
### Title: Peek at a query
### Aliases: peep

### ** Examples

## Not run: 
##D api('https://api.github.com/') %>% peep
##D api('https://api.github.com/') %>%
##D   api_path(repos, ropensci, rgbif, issues) %>%
##D   peep
##D 
##D repo_info <- list(username = 'craigcitro', repo = 'r-travis')
##D api('https://api.github.com/') %>%
##D   api_template(template = 'repos/{{username}}/{{repo}}/issues', data = repo_info) %>%
##D   peep
##D 
##D api("http://api.plos.org/search") %>%
##D   api_query(q = ecology, wt = json, fl = id, fl = journal) %>%
##D   peep
## End(Not run)



