library(DescTools)


### Name: PlotECDF
### Title: Empirical Cumulative Distribution Function
### Aliases: PlotECDF
### Keywords: hplot

### ** Examples

PlotECDF(d.pizza$temperature)

# make large vector
x <- rnorm(n=1e7)

# plot only 1000 points instead of 1e7
PlotECDF(x, breaks=1000)



