library(chebpol)


### Name: polyh
### Title: Polyharmonic splines on scattered data
### Aliases: polyh
### Keywords: internal

### ** Examples

## Not run: 
##D # a function on a 20-dimensional space
##D r <- runif(20)
##D r <- r/sum(r)
##D f <- function(x) 1/mean(log1p(r*x))
##D # 1000 random knots 
##D knots <- matrix(runif(20000), 20)
##D phs <- polyh(f, knots, 3)
##D # test it in a random point
##D s <- runif(20)
##D c(true=f(s), phs(s))
## End(Not run)



