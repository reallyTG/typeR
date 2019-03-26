library(rcoreoa)


### Name: core_articles
### Title: Get articles
### Aliases: core_articles core_articles_

### ** Examples

## Not run: 
##D core_articles(id = 21132995)
##D core_articles(id = 21132995, fulltext = TRUE)
##D core_articles(id = 21132995, citations = TRUE)
##D 
##D # when passing >1 article ID
##D ids <- c(20955435, 21132995, 21813171, 22815670, 23828884,
##D    23465055, 23831838, 23923390, 22559733)
##D ## you can use method="GET" with lapply or similar
##D res <- lapply(ids, core_articles)
##D vapply(res, "[[", "", c("data", "datePublished"))
##D 
##D ## or use method="POST" passing all at once
##D res <- core_articles(ids, method = "POST")
##D head(res$data)
##D res$data$authors
##D 
##D # just http request, get text back
##D core_articles_(id = '21132995')
##D ## POST, can pass many at once
##D core_articles_(id = ids, method = "POST")
## End(Not run)



