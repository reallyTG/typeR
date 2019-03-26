library(spatstat)


### Name: bw.relrisk
### Title: Cross Validated Bandwidth Selection for Relative Risk Estimation
### Aliases: bw.relrisk
### Keywords: spatial methods smooth

### ** Examples

  data(urkiola)
  ## Don't show: 
op <- spatstat.options(n.bandwidth=8)
## End(Don't show)
  b <- bw.relrisk(urkiola)
  b
  plot(b)
  b <- bw.relrisk(urkiola, hmax=20)
  plot(b)
  ## Don't show: 
spatstat.options(op)
## End(Don't show)



