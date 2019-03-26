library(spatstat)


### Name: pcf.fv
### Title: Pair Correlation Function obtained from K Function
### Aliases: pcf.fv
### Keywords: spatial nonparametric

### ** Examples

  # univariate point pattern
  X <- simdat
  ## Don't show: 
    X <- X[seq(1,npoints(X), by=4)]
  
## End(Don't show)
  K <- Kest(X)
  p <- pcf.fv(K, spar=0.5, method="b")
  plot(p, main="pair correlation function for simdat")
  # indicates inhibition at distances r < 0.3



