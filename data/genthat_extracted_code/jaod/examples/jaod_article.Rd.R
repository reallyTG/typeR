library(jaod)


### Name: jaod_article
### Title: Get an article by ID
### Aliases: jaod_article

### ** Examples

## Not run: 
##D out <- jaod_article(id = "0005e11ec616453f854070069385e057")
##D out$admin
##D out$last_updated
##D out$id
##D out$created_date
##D out$bibjson
##D 
##D ids <- c("73f781ad57094b98a0b46d8903fdc2c2",
##D   "0005e11ec616453f854070069385e057")
##D out <- lapply(ids, jaod_article)
##D out[[1]]
## End(Not run)



