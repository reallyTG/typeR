library(greta)


### Name: transforms
### Title: transformation functions for greta arrays
### Aliases: transforms inverse-links iprobit ilogit icloglog icauchit
###   log1pe imultilogit

### ** Examples

## Not run: 
##D 
##D  x1 <- normal(1, 3, dim = 10)
##D 
##D  # transformation to the unit interval
##D  p1 <- iprobit(x1)
##D  p2 <- ilogit(x1)
##D  p3 <- icloglog(x1)
##D  p4 <- icauchit(x1)
##D 
##D  # and to positive reals
##D  y <- log1pe(x1)
##D 
##D  # transform from 10x3 to 10x4, where rows are a complete set of
##D  # probabilities
##D  x2 <- normal(1, 3, dim = c(10, 3))
##D  z <- imultilogit(x2)
##D 
## End(Not run)



