library(ads)


### Name: kval
### Title: Multiscale local second-order neighbour density of a spatial
###   point pattern
### Aliases: kval print.kval summary.kval print.summary.kval
### Keywords: spatial

### ** Examples

  data(BPoirier)
  BP <- BPoirier
  # spatial point pattern in a rectangle sampling window of size [0,110] x [0,90]
  swr <- spp(BP$trees, win=BP$rect)
  kvswr <- kval(swr, 25, 1)
  summary(kvswr)
  plot(kvswr)

  # spatial point pattern in a circle with radius 50 centred on (55,45)
  swc <- spp(BP$trees, win=c(55,45,45))
  kvswc <- kval(swc, 25, 1)
  summary(kvswc)
  plot(kvswc)
  
  # spatial point pattern in a complex sampling window
  swrt <- spp(BP$trees, win=BP$rect, tri=BP$tri1)
  kvswrt <- kval(swrt, 25, 1)
  summary(kvswrt)
  plot(kvswrt)



