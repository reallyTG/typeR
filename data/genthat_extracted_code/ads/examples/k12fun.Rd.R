library(ads)


### Name: k12fun
### Title: Multiscale second-order neigbourhood analysis of a bivariate
###   spatial point pattern
### Aliases: k12fun
### Keywords: spatial

### ** Examples

  data(BPoirier)
  BP <- BPoirier
  # spatial point pattern in a rectangle sampling window of size [0,110] x [0,90]
  swrm <- spp(BP$trees, win=BP$rect, marks=BP$species)
  #testing population independence hypothesis
  k12swrm.pi <- k12fun(swrm, 25, 1, 500, marks=c("beech","oak"))
  plot(k12swrm.pi)
  #testing random labelling hypothesis
  k12swrm.rl <- k12fun(swrm, 25, 1, 500, H0="rl", marks=c("beech","oak"))
  plot(k12swrm.rl)

  # spatial point pattern in a circle with radius 50 centred on (55,45)
  swc <- spp(BP$trees, win=c(55,45,45), marks=BP$species)
  k12swc.pi <- k12fun(swc, 25, 1, 500, marks=c("beech","oak"))
  plot(k12swc.pi)
  
  # spatial point pattern in a complex sampling window
  swrt.rl <- spp(BP$trees, win=BP$rect, tri=BP$tri2, marks=BP$species)
  k12swrt.rl <- k12fun(swrt.rl, 25, 1, 500, H0="rl",marks=c("beech","oak"))
  plot(k12swrt.rl)
  #testing population independence hypothesis
  #requires minimizing the outer polygon
  xr<-range(BP$tri3$ax,BP$tri3$bx,BP$tri3$cx)
  yr<-range(BP$tri3$ay,BP$tri3$by,BP$tri3$cy)
  rect.min<-swin(c(xr[1], yr[1], xr[2], yr[2]))
  swrt.pi <- spp(BP$trees, window = rect.min, triangles = BP$tri3, marks=BP$species)
  k12swrt.pi <- k12fun(swrt.pi, 25, 1, nsim = 500, marks = c("beech", "oak"))
  plot(k12swrt.pi)



