library(EnvStats)


### Name: eqgevd
### Title: Estimate Quantiles of a Generalized Extreme Value Distribution
### Aliases: eqgevd
### Keywords: distribution htest

### ** Examples

  # Generate 20 observations from a generalized extreme value distribution 
  # with parameters location=2, scale=1, and shape=0.2, then compute the 
  # MLEs of location, shape,and threshold, and estimate the 90th percentile. 
  # (Note: the call to set.seed simply allows you to reproduce this example.)

  set.seed(498) 
  dat <- rgevd(20, location = 2, scale = 1, shape = 0.2) 
  eqgevd(dat, p = 0.9)

  #Results of Distribution Parameter Estimation
  #--------------------------------------------
  #
  #Assumed Distribution:            Generalized Extreme Value
  #
  #Estimated Parameter(s):          location = 1.6144631
  #                                 scale    = 0.9867007
  #                                 shape    = 0.2632493
  #
  #Estimation Method:               mle
  #
  #Estimated Quantile(s):           90'th %ile = 3.289912
  #
  #Quantile Estimation Method:      Quantile(s) Based on
  #                                 mle Estimators
  #
  #Data:                            dat
  #
  #Sample Size:                     20

  #----------

  # Clean up
  #---------
  rm(dat)



