library(ads)


### Name: krfun
### Title: Multiscale second-order neigbourhood analysis of a multivariate
###   spatial point pattern using Rao quandratic entropy
### Aliases: krfun
### Keywords: spatial

### ** Examples

  data(Paracou15)
  P15<-Paracou15
  # spatial point pattern in a rectangle sampling window of size 125 x 125
  swmr <- spp(P15$trees, win = c(175, 175, 250, 250), marks = P15$species)
  # testing the random labeling hypothesis
  krwmr.rl <- krfun(swmr, dis = P15$spdist, H0 = "rl", 25, 2, 50)
  #running more simulations is slow
  #krwmr.rl <- krfun(swmr, dis = P15$spdist, H0 = "rl", 25, 2, 500)
  plot(krwmr.rl)
  # testing the species equivalence hypothesis
  krwmr.se <- krfun(swmr, dis = P15$spdist, H0 = "se", 25, 2, 50)
  #running more simulations is slow
  #krwmr.se <- krfun(swmr, dis = P15$spdist, H0 = "se", 25, 2, 500)
  plot(krwmr.se)

  # spatial point pattern in a circle with radius 50 centred on (125,125)
  swmc <- spp(P15$trees, win = c(125,125,50), marks = P15$species)
  krwmc <- krfun(swmc, dis = P15$spdist, H0 = "rl", 25, 2, 100)
  #running more simulations is slow
  #krwmc <- krfun(swmc, dis = P15$spdist, H0 = "rl, 25, 2, 500)
  plot(krwmc)
  
  # spatial point pattern in a complex sampling window
  swrt <- spp(P15$trees, win = c(125,125,250,250), tri = P15$tri, marks = P15$species)
  krwrt <- krfun(swrt, dis = P15$spdist, H0 = "rl", 25, 2)
  #running simulations is slow
  #krwrt <- krfun(swrt, dis = P15$spdist, H0 = "rl", 25, 2, 500)
  plot(krwrt)



