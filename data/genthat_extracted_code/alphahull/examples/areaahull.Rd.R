library(alphahull)


### Name: areaahull
### Title: Area of the alpha-convex hull
### Aliases: areaahull
### Keywords: nonparametric

### ** Examples

## Not run: 
##D # Random sample in the unit square
##D x <- matrix(runif(500), nc = 2)
##D # Value of alpha
##D alpha <- 1
##D # alpha-convex hull
##D ahull.obj <- ahull(x, alpha = alpha)
##D # Area of the alpha-convex hull
##D areaahull(ahull.obj)
## End(Not run)



