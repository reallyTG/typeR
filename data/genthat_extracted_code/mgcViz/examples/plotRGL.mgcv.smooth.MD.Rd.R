library(mgcViz)


### Name: plotRGL.mgcv.smooth.MD
### Title: Visualizing a 2D slice of a smooth effects in 3D
### Aliases: plotRGL.mgcv.smooth.MD

### ** Examples

# Example 1: taken from ?mgcv::te, shows how tensor pruduct deals nicely with 
# badly scaled covariates (range of x 5% of range of z )
library(mgcViz)
n <- 1e3
x <- rnorm(n); y <- rnorm(n); z <- rnorm(n)

ob <- (x-z)^2 + (y-z)^2 + rnorm(n)
b <- gam(ob ~ s(x, y, z))
v <- getViz(b)

plotRGL(sm(v, 1), fix = c("z" = 0))

rgl.close() # Close

plotRGL(sm(v, 1), fix = c("z" = 1), residuals = TRUE)

# We can still work on the plot, for instance change the aspect ratio
library(rgl)
aspect3d(1, 2, 1)

rgl.close() # Close




