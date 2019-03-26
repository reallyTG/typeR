library(nws)


### Name: export
### Title: sleigh Class Method
### Aliases: export export-methods export,sleigh-method
### Keywords: methods

### ** Examples

## Not run: 
##D s <- sleigh()
##D m <- matrix(rnorm(16), 4, 4)
##D export(s, 'm', m)
##D eachWorker(s, function() m %*% matrix(rnorm(16), 4, 4), eo=list(closure=FALSE))
## End(Not run)



