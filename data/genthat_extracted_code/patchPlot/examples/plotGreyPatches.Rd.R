library(patchPlot)


### Name: plotGreyPatches
### Title: plotGreyPatches
### Aliases: plotGreyPatches

### ** Examples

maingrey <- runif(20)
auxgrey <- runif(20)
xvals <- c(rnorm(20, -3), rnorm(20, 3))
yvals <- rnorm(40)
plotGreyPatches(cbind(xvals, yvals), maingrey, auxgrey) # with 2 nuances per patch
plotGreyPatches(cbind(xvals, yvals), maingrey) # only one nuance



