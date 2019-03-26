library(bigGP)


### Name: distributeVector
### Title: Distribute a Vector to the Slave Processes
### Aliases: distributeVector

### ** Examples

## Not run: 
##D bigGP.init(3)
##D n <- 3000
##D x <- rnorm(n)
##D distributeVector(x, 'tmp', n = n)
##D y <- collectVector('tmp', n = n)
##D identical(x, y)
## End(Not run)



