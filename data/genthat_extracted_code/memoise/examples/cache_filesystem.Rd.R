library(memoise)


### Name: cache_filesystem
### Title: Filesystem Cache
### Aliases: cache_filesystem

### ** Examples


## Not run: 
##D # Use with Dropbox
##D 
##D db <- cache_filesystem("~/Dropbox/.rcache")
##D 
##D mem_runif <- memoise(runif, cache = db)
##D 
##D # Use with Google Drive
##D 
##D gd <- cache_filesystem("~/Google Drive/.rcache")
##D 
##D mem_runif <- memoise(runif, cache = gd)
##D 
## End(Not run)




