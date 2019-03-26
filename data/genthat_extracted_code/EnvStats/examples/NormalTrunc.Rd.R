library(EnvStats)


### Name: NormalTrunc
### Title: The Truncated Normal Distribution
### Aliases: NormalTrunc dnormTrunc pnormTrunc qnormTrunc rnormTrunc
### Keywords: distribution datagen

### ** Examples

  # Density of a truncated normal distribution with parameters 
  # mean=10, sd=2, min=8, max=13, evaluated at 10 and 11.5:

  dnormTrunc(c(10, 11.5), 10, 2, 8, 13) 
  #[1] 0.2575358 0.1943982

  #----------

  # The cdf of a truncated normal distribution with parameters 
  # mean=10, sd=2, min=8, max=13, evaluated at 10 and 11.5:

  pnormTrunc(c(10, 11.5), 10, 2, 8, 13) 
  #[1] 0.4407078 0.7936573

  #----------

  # The median of a truncated normal distribution with parameters 
  # mean=10, sd=2, min=8, max=13:

  qnormTrunc(.5, 10, 2, 8, 13) 
  #[1] 10.23074

  #----------

  # A random sample of 3 observations from a truncated normal distribution 
  # with parameters mean=10, sd=2, min=8, max=13. 
  # (Note: the call to set.seed simply allows you to reproduce this example.)

  set.seed(20) 
  rnormTrunc(3, 10, 2, 8, 13) 
  #[1] 11.975223 11.373711  9.361258



