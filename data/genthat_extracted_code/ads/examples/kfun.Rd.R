library(ads)


### Name: kfun
### Title: Multiscale second-order neigbourhood analysis of an univariate
###   spatial point pattern
### Aliases: kfun
### Keywords: spatial

### ** Examples

  data(BPoirier)
  BP <- BPoirier
  # spatial point pattern in a rectangle sampling window of size [0,110] x [0,90]
  swr <- spp(BP$trees, win=BP$rect)
  kswr <- kfun(swr,25,1,500)
  plot(kswr)

  # spatial point pattern in a circle with radius 50 centred on (55,45)
  swc <- spp(BP$trees, win=c(55,45,45))
  kswc <- kfun(swc, 25, 1, 500)
  plot(kswc)
  
  # spatial point pattern in a complex sampling window
  swrt <- spp(BP$trees, win=BP$rect, tri=BP$tri1)
  kswrt <- kfun(swrt, 25, 1, 500)
  plot(kswrt)



