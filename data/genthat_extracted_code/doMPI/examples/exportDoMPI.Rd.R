library(doMPI)


### Name: exportDoMPI
### Title: Export variables to doMPI cluster
### Aliases: exportDoMPI
### Keywords: utilities

### ** Examples

## Not run: 
##D cl <- startMPIcluster(count=2)
##D f <- function() 'foo'
##D g <- function() f()
##D exportDoMPI(cl, c('f', 'g'))
## End(Not run)



