library(alphahull)


### Name: lengthahull
### Title: Length of the boundary of the alpha-convex hull
### Aliases: lengthahull
### Keywords: nonparametric

### ** Examples

## Not run: 
##D # Random sample in the unit square
##D x <- matrix(runif(100), nc = 2)
##D # Value of alpha
##D alpha <- 0.2
##D # alpha-convex hull
##D ahull.obj <- ahull(x, alpha = alpha)
##D # Length of the alpha-convex hull
##D ahull.obj$length
## End(Not run)



