library(ads)


### Name: kp.fun
### Title: Multiscale second-order neigbourhood analysis of a multivariate
###   spatial point pattern
### Aliases: kp.fun ki.fun
### Keywords: spatial

### ** Examples

  data(BPoirier)
  BP <- BPoirier
  # multivariate spatial point pattern in a rectangle sampling window 
  swrm <- spp(BP$trees, win=BP$rect, marks=BP$species)
  kp.swrm <- kp.fun(swrm, 25, 1)
  plot(kp.swrm)
  
 # multivariate spatial point pattern in a circle with radius 50 centred on (55,45)
  swcm <- spp(BP$trees, win=c(55,45,45), marks=BP$species)
  kp.swcm <- kp.fun(swcm, 25, 1)
  plot(kp.swcm)
  
  # multivariate spatial point pattern in a complex sampling window
  swrtm <- spp(BP$trees, win=BP$rect, tri=BP$tri2, marks=BP$species)
  kp.swrtm <- kp.fun(swrtm, 25, 1)
  plot(kp.swrtm)



