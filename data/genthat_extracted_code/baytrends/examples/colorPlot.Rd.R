library(baytrends)


### Name: colorPlot
### Title: Plot Data
### Aliases: colorPlot colorPlot,numeric,numeric-method
###   colorPlot,Date,numeric-method colorPlot,POSIXt,numeric-method
###   colorPlot,numeric,numeric-method colorPlot,Date,numeric-method
###   colorPlot,POSIXt,numeric-method
### Keywords: hplot internal methods

### ** Examples

## Not run: 
##D set.seed(1)
##D X <- rnorm(32)
##D Y <- X + rnorm(32)
##D Z <- sqrt(X^2 + Y^2) # distance from origin
##D setGD()
##D # All defaults: color ramp from Z
##D colorPlot(X, Y, Z)
##D # See for examples of colorPlot:
##D vignette(topic="LineScatter", package="smwrGraphs")
## End(Not run)



