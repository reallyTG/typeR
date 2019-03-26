library(spatstat)


### Name: plot.ssf
### Title: Plot a Spatially Sampled Function
### Aliases: plot.ssf image.ssf contour.ssf
### Keywords: spatial hplot

### ** Examples

  a <- ssf(cells, nndist(cells, k=1:3))
  plot(a, how="points")
  plot(a, how="smoothed")
  plot(a, how="nearest")



