library(rcoreoa)


### Name: core_articles_history
### Title: Get article history
### Aliases: core_articles_history core_articles_history_

### ** Examples

## Not run: 
##D core_articles_history(id = 21132995)
##D 
##D ids <- c(20955435, 21132995, 21813171, 22815670, 14045109, 23828884,
##D    23465055, 23831838, 23923390, 22559733)
##D res <- core_articles_history(ids)
##D vapply(res, function(z) z$data$datetime[1], "")
##D 
##D # just http request, get text back
##D core_articles_history_(21132995)
## End(Not run)



