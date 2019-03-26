library(alphahull)


### Name: plot.ahull
### Title: Plot the alpha-convex hull
### Aliases: plot.ahull
### Keywords: nonparametric

### ** Examples

## Not run: 
##D # Random sample in the unit square
##D x <- matrix(runif(100), nc = 2)
##D # Value of alpha
##D alpha <- 0.2
##D # alpha-convex hull
##D ahull.obj <- ahull(x, alpha = alpha)
##D # Plot including the alpha-convex hull in pink, alpha-shape in blue, 
##D # sample points in black, voronoi diagram in green 
##D # and Delaunay triangulation in red 
##D plot(ahull.obj, do.shape = TRUE, wlines = "both", col = c(6, 4, 1, 2, 3))
##D 
##D # Random sample  from a uniform distribution on a Koch snowflake 
##D # with initial side length 1 and 3 iterations
##D x <- rkoch(2000, side = 1, niter = 3)
##D # Value of alpha
##D alpha <- 0.05
##D # Alpha-convex hull
##D ahull.obj <- ahull(x, alpha = alpha)
##D plot(ahull.obj)
## End(Not run)



