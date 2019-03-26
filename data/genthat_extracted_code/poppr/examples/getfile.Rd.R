library(poppr)


### Name: getfile
### Title: Get a file name and path and store them in a list.
### Aliases: getfile

### ** Examples

## Not run: 
##D 
##D x <- getfile()
##D poppr(x$files)
##D 
##D y <- getfile(multi=TRUE, pattern="^.+?dat$") 
##D #useful for reading in multiple FSTAT formatted files.
##D 
##D yfiles <- poppr.all(y$files)
##D 
##D # Write results to a file in that directory.
##D setwd(y$path)
##D write.csv(yfiles)
## End(Not run)  



