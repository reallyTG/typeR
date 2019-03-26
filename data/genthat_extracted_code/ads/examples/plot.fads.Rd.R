library(ads)


### Name: plot.fads
### Title: Plot second-order neigbourhood functions
### Aliases: plot.fads plot.fads.kfun plot.fads.k12fun plot.fads.kpqfun
###   plot.fads.kp.fun plot.fads.kmfun plot.fads.ksfun plot.fads.krfun
###   plot.fads.kdfun plot.fads.mimetic
### Keywords: spatial

### ** Examples

  data(BPoirier)
  BP <- BPoirier
  # Ripley's function 
  swr <- spp(BP$trees, win=BP$rect)
  k.swr <- kfun(swr, 25, 1, 500)
  plot(k.swr)
  
  # Intertype function
  swrm <- spp(BP$trees, win=BP$rect, marks=BP$species)
  k12.swrm <- k12fun(swrm, 25, 1, 500, marks=c("beech","oak"))
  plot(k12.swrm, opt="L", cols=1)
  
  # Mark correlation function
  swrm <- spp(BP$trees, win=BP$rect, marks=BP$dbh)
  km.swrm <- kmfun(swrm, 25, 1, 500)
  plot(km.swrm, main="Example 1", sub=NULL, legend=FALSE)




