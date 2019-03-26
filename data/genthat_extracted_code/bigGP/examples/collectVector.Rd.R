library(bigGP)


### Name: collectVector
### Title: Return a Distributed Vector to the Master Process
### Aliases: collectVector

### ** Examples

## Not run: 
##D bigGP.init(3)
##D n <- 3000
##D x <- rnorm(n)
##D distributeVector(x, 'tmp', n = n)
##D y <- collectVector('tmp', n = n)
##D identical(x, y)
## End(Not run)



