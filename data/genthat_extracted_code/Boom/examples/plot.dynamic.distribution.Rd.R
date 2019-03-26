library(Boom)


### Name: plot.dynamic.distribution
### Title: Plots the pointwise evolution of a distribution over an index
###   set.
### Aliases: PlotDynamicDistribution
### Keywords: hplot

### ** Examples

  x <- t(matrix(rnorm(1000 * 100, 1:100, 1:100), nrow=100))
  ## x has 1000 rows, and 100 columns.  Column i is N(i, i^2) noise.

  PlotDynamicDistribution(x)
  time <- as.Date("2010-01-01", format = "%Y-%m-%d") + (0:99 - 50)*7
  PlotDynamicDistribution(x, time)



