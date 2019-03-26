library(spatstat)


### Name: bw.smoothppp
### Title: Cross Validated Bandwidth Selection for Spatial Smoothing
### Aliases: bw.smoothppp
### Keywords: spatial methods smooth

### ** Examples

  data(longleaf)
  ## Don't show: 
op <- spatstat.options(n.bandwidth=8)
## End(Don't show)
  b <- bw.smoothppp(longleaf)
  b
  plot(b)
  ## Don't show: 
spatstat.options(op)
## End(Don't show)



