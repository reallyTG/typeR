library(alphahull)


### Name: inahull
### Title: Determines for one or more points whether they belong to the
###   alpha-convex hull
### Aliases: inahull
### Keywords: nonparametric

### ** Examples

## Not run: 
##D # Random sample in the unit square
##D x <- matrix(runif(100), nc = 2)
##D # Value of alpha
##D alpha <- 0.2
##D # alpha-convex hull
##D ahull.obj <- ahull(x, alpha = alpha)
##D # Check if the point (0.5, 0.5) belongs to the alpha-convex hull
##D inahull(ahull.obj, p = c(0.5, 0.5))
##D # Check if the points (0.5, 0.5) and (2, 2) belong to the alpha-convex hull
##D inahull(ahull.obj, p = rbind(c(0.5, 0.5), c(2, 2)))
## End(Not run)



