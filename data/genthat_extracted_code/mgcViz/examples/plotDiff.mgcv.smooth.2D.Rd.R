library(mgcViz)


### Name: plotDiff.mgcv.smooth.2D
### Title: Plotting differences between two 2D smooth effects
### Aliases: plotDiff.mgcv.smooth.2D

### ** Examples

# Simulate data and add factors uncorrelated to the response
library(mgcViz)
set.seed(235)
dat <- gamSim(1,n=1500,dist="normal",scale=20)
dat$fac <- as.factor( sample(c("A1", "A2", "A3"), nrow(dat), replace = TRUE) ) 
dat$logi <- as.logical( sample(c(TRUE, FALSE), nrow(dat), replace = TRUE) ) 
bs <- "cr"; k <- 12
b <- gam(y ~ s(x2, x1, by = fac), data=dat)
o <- getViz(b, nsim = 0)

# Extract the smooths correspoding to "A1" and "A2" and plot their difference
pl <- plotDiff(s1 = sm(o, 1), s2 = sm(o, 2))
pl + l_fitRaster() + l_fitContour()

## Not run: 
##D # Plot p-values for differences between the two smooths
##D pl + l_pvRaster() + l_pvContour()
## End(Not run)




