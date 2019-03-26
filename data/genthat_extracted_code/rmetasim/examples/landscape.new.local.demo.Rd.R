library(rmetasim)


### Name: landscape.new.local.demo
### Title: Create a Local Demography
### Aliases: landscape.new.local.demo
### Keywords: misc

### ** Examples

  
  exampleS <- matrix(c(0.1, 0, 0.5, 0.3), nrow = 2)
  exampleR <- matrix(c(0, 1.1, 0, 0), nrow = 2)
  exampleM <- matrix(c(0, 0, 0, 1), nrow = 2)
  
  exampleland <- landscape.new.empty()
  exampleland <- landscape.new.intparam(exampleland, s=2)
  exampleland <- landscape.new.floatparam(exampleland)
  exampleland <- landscape.new.switchparam(exampleland)
  exampleland <- landscape.new.local.demo(exampleland,exampleS,exampleR,exampleM)

  exampleland$demography$localdem

  rm(exampleS)
  rm(exampleR)
  rm(exampleM)
  rm(exampleland)



