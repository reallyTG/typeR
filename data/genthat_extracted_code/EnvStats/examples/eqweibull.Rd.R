library(EnvStats)


### Name: eqweibull
### Title: Estimate Quantiles of a Weibull Distribution
### Aliases: eqweibull
### Keywords: distribution htest

### ** Examples

  # Generate 20 observations from a Weibull distribution with parameters 
  # shape=2 and scale=3, then estimate the parameters via maximum likelihood,
  # and estimate the 90'th percentile. 
  # (Note: the call to set.seed simply allows you to reproduce this example.)

  set.seed(250) 
  dat <- rweibull(20, shape = 2, scale = 3) 
  eqweibull(dat, p = 0.9) 

  #Results of Distribution Parameter Estimation
  #--------------------------------------------
  #
  #Assumed Distribution:            Weibull
  #
  #Estimated Parameter(s):          shape = 2.673098
  #                                 scale = 3.047762
  #
  #Estimation Method:               mle
  #
  #Estimated Quantile(s):           90'th %ile = 4.163755
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



