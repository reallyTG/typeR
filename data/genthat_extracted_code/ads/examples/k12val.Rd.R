library(ads)


### Name: k12val
### Title: Multiscale local second-order neighbour density of a bivariate
###   spatial point pattern
### Aliases: k12val print.k12val summary.k12val print.summary.k12val
### Keywords: spatial

### ** Examples

  data(BPoirier)
  BP <- BPoirier
  # spatial point pattern in a rectangle sampling window of size [0,110] x [0,90]
  swrm <- spp(BP$trees, win=BP$rect, marks=BP$species)
  k12vswrm <- k12val(swrm, 25, 1, marks=c("beech","oak"))
  summary(k12vswrm)
  plot(k12vswrm)
 
  # spatial point pattern in a circle with radius 50 centred on (55,45)
  swc <- spp(BP$trees, win=c(55,45,45), marks=BP$species)
  k12vswc <- k12val(swc, 25, 1, marks=c("beech","oak"))
  summary(k12vswc)
  plot(k12vswc)
  
  # spatial point pattern in a complex sampling window
  swrt <- spp(BP$trees, win=BP$rect, tri=BP$tri2, marks=BP$species)
  k12vswrt <- k12val(swrt, 25, 1, marks=c("beech","oak"))
  summary(k12vswrt)
  plot(k12vswrt)



