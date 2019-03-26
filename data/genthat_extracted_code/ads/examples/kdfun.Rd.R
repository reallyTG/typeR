library(ads)


### Name: kdfun
### Title: Multiscale second-order neigbourhood analysis of a spatial
###   phylogenetic or functional community pattern from fully mapped data
### Aliases: kdfun
### Keywords: spatial

### ** Examples

  data(Paracou15)
  P15<-Paracou15
  # spatial point pattern in a rectangle sampling window of size 125 x 125
  swmr <- spp(P15$trees, win = c(175, 175, 250, 250), marks = P15$species)
  # testing the species equivalence hypothesis
  kdswmr <- kdfun(swmr, dis = P15$spdist, 50, 2, 100)
  #running more simulations is slow
  #kdswmr <- drfun(swmr, dis = P15$spdist, 50, 2, 500)
  plot(kdswmr)

  # spatial point pattern in a circle with radius 50 centred on (125,125)
  swmc <- spp(P15$trees, win = c(125,125,50), marks = P15$species)
  kdswmc <- kdfun(swmc, dis = P15$spdist, 50, 2, 100)
  #running more simulations is slow
  #kdswmc <- kdfun(swmc, dis = P15$spdist, 50, 2, 500)
  plot(kdswmc)
  
  # spatial point pattern in a complex sampling window
  swrt <- spp(P15$trees, win = c(125,125,250,250), tri = P15$tri, marks = P15$species)
  kdswrt <- kdfun(swrt, dis = P15$spdist, 50, 2, 100)
  #running simulations is slow
  #kdswrt <- kdfun(swrt, dis = P15$spdist, 50, 2, 500)
  plot(kdswrt)



