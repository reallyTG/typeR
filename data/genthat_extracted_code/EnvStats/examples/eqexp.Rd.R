library(EnvStats)


### Name: eqexp
### Title: Estimate Quantiles of an Exponential Distribution
### Aliases: eqexp
### Keywords: distribution htest

### ** Examples

  # Generate 20 observations from an exponential distribution with parameter 
  # rate=2, then estimate the parameter and estimate the 90th percentile. 
  # (Note: the call to set.seed simply allows you to reproduce this example.)

  set.seed(250) 
  dat <- rexp(20, rate = 2) 
  eqexp(dat, p = 0.9) 

  #Results of Distribution Parameter Estimation
  #--------------------------------------------
  #
  #Assumed Distribution:            Exponential
  #
  #Estimated Parameter(s):          rate = 2.260587
  #
  #Estimation Method:               mle/mme
  #
  #Estimated Quantile(s):           90'th %ile = 1.018578
  #
  #Quantile Estimation Method:      Quantile(s) Based on
  #                                 mle/mme Estimators
  #
  #Data:                            dat
  #
  #Sample Size:                     20
  #

  #----------

  # Clean up
  #---------
  rm(dat)



