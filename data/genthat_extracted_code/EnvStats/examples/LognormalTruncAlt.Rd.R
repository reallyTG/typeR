library(EnvStats)


### Name: LognormalTruncAlt
### Title: The Truncated Lognormal Distribution (Alternative
###   Parameterization)
### Aliases: LognormalTruncAlt dlnormTruncAlt plnormTruncAlt qlnormTruncAlt
###   rlnormTruncAlt
### Keywords: distribution datagen

### ** Examples

  # Density of a truncated lognormal distribution with parameters 
  # mean=10, cv=1, min=0, max=20, evaluated at 2 and 12:

  dlnormTruncAlt(c(2, 12), 10, 1, 0, 20) 
  #[1] 0.08480874 0.03649884

  #----------

  # The cdf of a truncated lognormal distribution with parameters 
  # mean=10, cv=1, min=0, max=20, evaluated at 2 and 12:

  plnormTruncAlt(c(2, 4), 10, 1, 0, 20) 
  #[1] 0.07230627 0.82467603

  #----------

  # The median of a truncated lognormal distribution with parameters 
  # mean=10, cv=1, min=0, max=20:

  qlnormTruncAlt(.5, 10, 1, 0, 20) 
  #[1] 6.329505

  #----------

  # A random sample of 3 observations from a truncated lognormal distribution 
  # with parameters mean=10, cv=1, min=0, max=20. 
  # (Note: the call to set.seed simply allows you to reproduce this example.)

  set.seed(20) 
  rlnormTruncAlt(3, 10, 1, 0, 20) 
  #[1]  6.685391 17.445387 18.543553



