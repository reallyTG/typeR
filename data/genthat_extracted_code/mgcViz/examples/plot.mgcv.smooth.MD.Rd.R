library(mgcViz)


### Name: plot.mgcv.smooth.MD
### Title: Plotting slice of higher-dimensional smooth effects
### Aliases: plot.mgcv.smooth.MD

### ** Examples

## 3D example
library(mgcViz)
n <- 1e3
x <- rnorm(n); y <- rnorm(n); z <- rnorm(n)

ob <- (x-z)^2 + (y-z)^2 + rnorm(n)
b <- gam(ob ~ s(x, y, z))
b <- getViz(b)

# Plot one 2D slice
plot( sm(b, 1), fix = c("z"=0) ) + l_fitRaster(noiseup = TRUE, mul = 3) + 
  l_fitContour(linetype = 2) + l_points(shape =  2)

## Not run: 
##D ## 4D
##D n <- 5e3
##D x <- rnorm(n); y <- rnorm(n); z <- rnorm(n); z2 <- rnorm(n)
##D 
##D ob <- (x-z)^2 + (y-z)^2 + z2^3 + rnorm(n)
##D b1 <- bam(ob ~ s(x, y, z, z2), discrete = TRUE)
##D b1 <- getViz(b1)
##D 
##D # Plot one 2D slice
##D plot(sm(b1, 1), fix = c("z"=0, "z2"=1)) + l_fitRaster() + l_fitContour()
## End(Not run)




