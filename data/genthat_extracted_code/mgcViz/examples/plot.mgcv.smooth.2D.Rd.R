library(mgcViz)


### Name: plot.mgcv.smooth.2D
### Title: Plotting two dimensional smooth effects
### Aliases: plot.mgcv.smooth.2D plot.multi.mgcv.smooth.2D

### ** Examples

library(mgcViz)
set.seed(2) ## simulate some data...
dat <- gamSim(1, n = 700, dist = "normal", scale = 2)
b <- gam(y ~ s(x0) + s(x1, x2) + s(x3), data = dat, method = "REML")
b <- getViz(b)

# Plot 2D effect with noised-up raster, contour and rug for design points 
# Opacity is proportional to the significance of the effect
plot(sm(b, 2)) + l_fitRaster(pTrans = zto1(0.05, 2, 0.1), noiseup = TRUE) + 
  l_rug() + l_fitContour()  

## Not run: 
##D # Plot contour of effect joint density of design points
##D plot(sm(b, 2)) + l_dens(type = "joint") + l_points() + l_fitContour() + 
##D   coord_cartesian(expand = FALSE) # Fill the plot
##D   
##D ###
##D # Quantile GAM example
##D ###
##D b <- mqgamV(y ~ s(x0) + s(x1, x2) + s(x3), qu = c(0.3, 0.7), data = dat)
##D 
##D plot(sm(b, 2)) + l_fitRaster(noiseup = TRUE) + l_fitContour(colour = 2)
## End(Not run)



