library(rcoreoa)


### Name: core_repos_search_
### Title: Search CORE
### Aliases: core_repos_search_ core_search core_search_

### ** Examples

## Not run: 
##D core_search(query = 'ecology')
##D core_search(query = 'ecology', parse = FALSE)
##D core_search(query = 'ecology', limit = 12)
##D 
##D core_search_(query = 'ecology')
##D library("jsonlite")
##D jsonlite::fromJSON(core_search_(query = 'ecology'))
##D 
##D query <- c('data mining', 'machine learning', 'semantic web')
##D 
##D # post request
##D res <- core_search(query)
##D head(res$data)
##D res$data$id
## End(Not run)



