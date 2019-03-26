library(rmetasim)


### Name: landscape.new.epoch
### Title: Create an Epoch
### Aliases: landscape.new.epoch
### Keywords: misc

### ** Examples

  
  exampleS <- matrix(c(0.1, 0, 0.5, 0.3), nrow = 2)
  exampleR <- matrix(c(0, 1.1, 0, 0), nrow = 2)
  exampleM <- matrix(c(0, 0, 0, 1), nrow = 2)
  
  exampleland <- landscape.new.empty()
  exampleland <- landscape.new.intparam(exampleland, s=2, h=2)
  exampleland <- landscape.new.floatparam(exampleland)
  exampleland <- landscape.new.switchparam(exampleland)
  exampleland <- landscape.new.local.demo(exampleland,exampleS,exampleR,exampleM)

  ## nonsense matricies
  exampleS <- matrix(c(rep(0,4),
                rep(1,4),
                rep(0,4),
                rep(1,4)), nrow = 4)
  exampleR <- matrix(c(rep(0.5,4),
                rep(0,4),
                rep(0.5,4),
                rep(0,4)), nrow = 4)
  exampleM <- matrix(c(rep(0,4),
                rep(.25,4),
                rep(0,4),
                rep(0,4)), nrow = 4)

  ## defaults
  exampleland<- landscape.new.epoch(exampleland,exampleS,exampleR,exampleM)

  exampleland$demography$epochs[[1]]

  rm(exampleS)
  rm(exampleR)
  rm(exampleM)
  rm(exampleland)



