library(paleoTS)


### Name: ESD
### Title: Compute Expected Squared Divergence (ESD) for simple
###   evolutionary models
### Aliases: ESD
### Keywords: models ts

### ** Examples

  # simulate random walk
  x<- sim.GRW(ns=20)
  esd.urw<- ESD(x, dt=10, model="URW")
  esd.all<- ESD(x, dt=10, model="allThree") 
  



