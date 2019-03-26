library(chebpol)


### Name: slappx
### Title: Simplex Linear approximation on scattered data
### Aliases: slappx
### Keywords: internal

### ** Examples

## Not run: 
##D knots <- matrix(runif(3*1000), 3)
##D f <- function(x) exp(-sum(x^2))
##D g <- slappx(f, knots)
##D a <- matrix(runif(3*6), 3)
##D rbind(true=apply(a,2,f), sl=g(a))
## End(Not run)




