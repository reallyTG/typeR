library(secr)


### Name: pdot
### Title: Net Detection Probability
### Aliases: pdot CVpdot
### Keywords: manip

### ** Examples


  temptrap <- make.grid()
  ## per-session detection probability for an individual centred
  ## at a corner trap. By default, noccasions = 5.
  pdot (c(0,0), temptrap, detectpar = list(g0 = 0.2, sigma = 25),
    noccasions = 5)
    
  msk <- make.mask(temptrap, buffer = 100)
  CVpdot(msk, temptrap, detectpar = list(g0 = 0.2, sigma = 25),
    noccasions = 5)
    



