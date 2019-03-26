library(rv)


### Name: print.rvfactor
### Title: Categorical Random Variables (Random Factors)
### Aliases: print.rvfactor rvfactor rvfactor.rv is.rvfactor as.rvfactor
###   as.rv.rvfactor rvfactor.default
### Keywords: classes

### ** Examples


  # Probabilities of each integer of trunc(Z) where Z ~ N(0,1) ?
  x <- rvnorm(1)
  rvfactor(trunc(x))
  rvfactor(x>0)
  rvfactor(rvpois(1, lambda=0.5))




