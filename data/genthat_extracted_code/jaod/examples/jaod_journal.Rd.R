library(jaod)


### Name: jaod_journal
### Title: Get a journal by ID
### Aliases: jaod_journal

### ** Examples

## Not run: 
##D out <- jaod_journal(id = "f3f2e7f23d444370ae5f5199f85bc100")
##D out$admin
##D out$last_updated
##D out$id
##D out$created_date
##D out$bibjson
##D 
##D ids <- c("f3f2e7f23d444370ae5f5199f85bc100",
##D "9abfb36b06404e8a8566e1a44180bbdc")
##D out <- lapply(ids, jaod_journal)
##D out[[1]]
## End(Not run)



