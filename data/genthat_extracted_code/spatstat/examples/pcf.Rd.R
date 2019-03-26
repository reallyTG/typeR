library(spatstat)


### Name: pcf
### Title: Pair Correlation Function
### Aliases: pcf
### Keywords: spatial nonparametric

### ** Examples

  # ppp object
  X <- simdat
  ## Don't show: 
    X <- X[seq(1,npoints(X), by=4)]
  
## End(Don't show)
  p <- pcf(X)
  plot(p)

  # fv object
  K <- Kest(X)
  p2 <- pcf(K, spar=0.8, method="b")
  plot(p2)

  # multitype pattern; fasp object
  amaK <- alltypes(amacrine, "K")
  amap <- pcf(amaK, spar=1, method="b")
  plot(amap)



