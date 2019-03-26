library(jaod)


### Name: jaod_article_search
### Title: Search for articles
### Aliases: jaod_article_search

### ** Examples

## Not run: 
##D out <- jaod_article_search(query = "license:CC-BY")
##D out
##D out$results
##D 
##D ## get DOIs or other article IDs
##D names(out$results$bibjson.identifier) <- out$results$id
##D do.call(rbind, out$results$bibjson.identifier)
##D 
##D # more egs
##D jaod_article_search(query = "issn:1544-9173")
##D jaod_article_search(query = "publisher:dove")
##D 
##D # sorting
##D res <- jaod_article_search(query="Pinus contorta", sort="year:desc",
##D   pageSize = 50)
##D res$results$bibjson.year
##D jaod_article_search(query="green", sort="bibjson.year:desc")
## End(Not run)



