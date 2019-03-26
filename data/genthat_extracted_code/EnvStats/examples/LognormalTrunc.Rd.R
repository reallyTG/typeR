library(EnvStats)


### Name: LognormalTrunc
### Title: The Truncated Lognormal Distribution
### Aliases: LognormalTrunc dlnormTrunc plnormTrunc qlnormTrunc rlnormTrunc
### Keywords: distribution datagen

### ** Examples

  # Density of a truncated lognormal distribution with parameters 
  # meanlog=1, sdlog=0.75, min=0, max=10, evaluated at 2 and 4:

  dlnormTrunc(c(2, 4), 1, 0.75, 0, 10) 
  #[1] 0.2551219 0.1214676

  #----------

  # The cdf of a truncated lognormal distribution with parameters 
  # meanlog=1, sdlog=0.75, min=0, max=10, evaluated at 2 and 4:

  plnormTrunc(c(2, 4), 1, 0.75, 0, 10) 
  #[1] 0.3558867 0.7266934

  #----------

  # The median of a truncated lognormal distribution with parameters 
  # meanlog=1, sdlog=0.75, min=0, max=10:

  qlnormTrunc(.5, 1, 0.75, 0, 10) 
  #[1] 2.614945

  #----------

  # A random sample of 3 observations from a truncated lognormal distribution 
  # with parameters meanlog=1, sdlog=0.75, min=0, max=10. 
  # (Note: the call to set.seed simply allows you to reproduce this example.)

  set.seed(20) 
  rlnormTrunc(3, 1, 0.75, 0, 10) 
  #[1] 5.754805 4.372218 1.706815



