library(memuse)


### Name: filesize
### Title: filesize
### Aliases: filesize Sys.filesize

### ** Examples

## Not run: 
##D library(memuse)
##D 
##D x <- rnorm(1e5)
##D memuse(x) ### size in ram
##D 
##D tmp <- tempfile()
##D saveRDS(x, file=tmp)
##D Sys.filesize(tmp) ### size on disk
##D unlink(tmp)
## End(Not run)




