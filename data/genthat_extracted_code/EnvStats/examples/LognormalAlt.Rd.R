library(EnvStats)


### Name: LognormalAlt
### Title: The Lognormal Distribution (Alternative Parameterization)
### Aliases: LognormalAlt dlnormAlt plnormAlt qlnormAlt rlnormAlt
### Keywords: distribution datagen

### ** Examples

  # Density of the lognormal distribution with parameters 
  # mean=10 and cv=1, evaluated at 5: 

  dlnormAlt(5, mean = 10, cv = 1) 
  #[1] 0.08788173

  #----------

  # The cdf of the lognormal distribution with parameters mean=2 and cv=3, 
  # evaluated at 4: 

  plnormAlt(4, 2, 3) 
  #[1] 0.8879132

  #----------

  # The median of the lognormal distribution with parameters 
  # mean=10 and cv=1: 

  qlnormAlt(0.5, mean = 10, cv = 1) 
  #[1] 7.071068

  #----------

  # Random sample of 3 observations from a lognormal distribution with 
  # parameters mean=10 and cv=1. 
  # (Note: the call to set.seed simply allows you to reproduce this example.)

  set.seed(20) 
  rlnormAlt(3, mean = 10, cv = 1) 
  #[1] 18.615797  4.341402 31.265293



