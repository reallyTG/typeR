library(ads)


### Name: kmfun
### Title: Multiscale second-order neigbourhood analysis of a marked
###   spatial point pattern
### Aliases: kmfun
### Keywords: spatial

### ** Examples

  data(BPoirier)
  BP <- BPoirier
  # spatial point pattern in a rectangle sampling window of size [0,110] x [0,90]
  swrm <- spp(BP$trees, win=BP$rect, marks=BP$dbh)
  kmswrm <- kmfun(swrm, 25, 2, 500)
  plot(kmswrm)
  
  # spatial point pattern in a circle with radius 50 centred on (55,45)
  swc <- spp(BP$trees, win=c(55,45,45), marks=BP$dbh)
  kmswc <- kmfun(swc, 25, 2, 500)
  plot(kmswc)

  # spatial point pattern in a complex sampling window
  swrt <- spp(BP$trees, win=BP$rect, tri=BP$tri2, marks=BP$dbh)
  kmswrt <- kmfun(swrt, 25, 2, 500)
  plot(kmswrt)




