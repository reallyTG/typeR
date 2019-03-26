library(spatstat)


### Name: F3est
### Title: Empty Space Function of a Three-Dimensional Point Pattern
### Aliases: F3est
### Keywords: spatial nonparametric

### ** Examples

  ## Don't show: 
op <- spatstat.options(nvoxel=2^18)
## End(Don't show)
  X <- rpoispp3(42)
  Z <- F3est(X)
  if(interactive()) plot(Z)
  ## Don't show: 
spatstat.options(op)
## End(Don't show)



