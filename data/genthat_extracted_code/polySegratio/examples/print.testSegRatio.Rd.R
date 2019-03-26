library(polySegratio)


### Name: print.testSegRatio
### Title: Print objects of class testSegRatio
### Aliases: print.testSegRatio
### Keywords: manip

### ** Examples


  ## simulated data
  a <- sim.autoMarkers(ploidy = 8, c(0.7,0.2,0.09,0.01))
  ac <- test.segRatio(a$seg.ratios, ploidy=8, method="chi.squared")
  print(ac)



