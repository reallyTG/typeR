library(rcoreoa)


### Name: core_articles_search
### Title: Search CORE articles
### Aliases: core_articles_search core_articles_search_

### ** Examples

## Not run: 
##D core_articles_search(query = 'ecology')
##D core_articles_search(query = 'ecology', parse = FALSE)
##D core_articles_search(query = 'ecology', limit = 12)
##D out = core_articles_search(query = 'ecology', fulltext = TRUE)
##D 
##D core_articles_search_(query = 'ecology')
##D jsonlite::fromJSON(core_articles_search_(query = 'ecology'))
##D 
##D # post request
##D query <- c('data mining', 'semantic web')
##D res <- core_articles_search(query)
##D head(res$data)
##D res$data[[2]]$doi
## End(Not run)



