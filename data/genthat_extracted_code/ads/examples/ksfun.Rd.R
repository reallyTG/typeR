library(ads)


### Name: ksfun
### Title: Multiscale second-order neigbourhood analysis of a multivariate
###   spatial point pattern using Simpson diversity
### Aliases: ksfun
### Keywords: spatial

### ** Examples

  data(Paracou15)
  P15<-Paracou15
  # spatial point pattern in a rectangle sampling window of size 125 x 125
  swmr <- spp(P15$trees, win = c(125, 125, 250, 250), marks = P15$species)
  kswmr <- ksfun(swmr, 50, 5, 500)
  plot(kswmr)

  # spatial point pattern in a circle with radius 50 centred on (125,125)
  swmc <- spp(P15$trees, win = c(125, 125, 50), marks = P15$species)
  kswmc <- ksfun(swmc, 50, 5, 500)
  plot(kswmc)
  
  # spatial point pattern in a complex sampling window
  swrt <- spp(P15$trees, win = c(125, 125, 250, 250), tri=P15$tri, marks=P15$species)
  kswrt <- ksfun(swrt, 50, 5, 500)
  plot(kswrt)



