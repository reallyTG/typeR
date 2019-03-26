library(etseed)


### Name: stats
### Title: Get etcd statistics
### Aliases: stats

### ** Examples

## Not run: 
##D # make a client
##D cli <- etcd()
##D 
##D # leader stats
##D cli$stats()
##D 
##D # self stats
##D cli$stats("self")
##D 
##D # store stats
##D cli$stats("store")
##D 
##D # Prety or not
##D cli$stats(pretty = TRUE)
##D cli$stats(pretty = FALSE)
## End(Not run)



