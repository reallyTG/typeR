library(ads)


### Name: kpqfun
### Title: Multiscale second-order neigbourhood analysis of a multivariate
###   spatial point pattern
### Aliases: kpqfun kijfun
### Keywords: spatial

### ** Examples

  data(BPoirier)
  BP <- BPoirier
  # multivariate spatial point pattern in a rectangle sampling window 
  swrm <- spp(BP$trees, win=BP$rect, marks=BP$species)
  kpqswrm <- kpqfun(swrm, 25, 1)
  plot(kpqswrm)
  
 # multivariate spatial point pattern in a circle with radius 50 centred on (55,45)
  swcm <- spp(BP$trees, win=c(55,45,45), marks=BP$species)
  kpqswcm <- kpqfun(swcm, 25, 1)
  plot(kpqswcm)
  
  # multivariate spatial point pattern in a complex sampling window
  swrtm <- spp(BP$trees, win=BP$rect, tri=BP$tri2, marks=BP$species)
  kpqswrtm <- kpqfun(swrtm, 25, 1)
  plot(kpqswrtm)




