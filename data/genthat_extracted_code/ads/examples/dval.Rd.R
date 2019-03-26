library(ads)


### Name: dval
### Title: Multiscale local density of a spatial point pattern
### Aliases: dval print.dval summary.dval print.summary.dval
### Keywords: spatial

### ** Examples

  data(BPoirier)
  BP <- BPoirier
  # spatial point pattern in a rectangle sampling window of size [0,110] x [0,90]
  swr <- spp(BP$trees, win=BP$rect)
  dswr <- dval(swr,25,1,11,9)
  summary(dswr)
  plot(dswr)
  
  # spatial point pattern in a circle with radius 50 centred on (55,45)
  swc <- spp(BP$trees, win=c(55,45,45))
  dswc <- dval(swc,25,1,9,9)
  summary(dswc)
  plot(dswc)
  
  # spatial point pattern in a complex sampling window
  swrt <- spp(BP$trees, win=BP$rect, tri=BP$tri1)
  dswrt <- dval(swrt,25,1,11,9)
  summary(dswrt)
  plot(dswrt)



