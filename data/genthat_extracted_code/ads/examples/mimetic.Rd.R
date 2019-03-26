library(ads)


### Name: mimetic
### Title: Univariate point pattern simulation by mimetic point process
### Aliases: mimetic plot.mimetic
### Keywords: spatial

### ** Examples

  data(BPoirier)
  BP<-BPoirier
  # performing point pattern analysis in a rectangle sampling window
  swr <- spp(BP$trees, win=BP$rect)
  plot(swr)
  
  # performing the mimetic point process from "spp" object
  mimswr <- mimetic(swr, 20, 2)
  plot(mimswr)

   # performing the mimetic point process from "fads" object
  mimkswr <- mimetic(kfun(swr, 20, 2))
  plot(mimkswr)
  
  


