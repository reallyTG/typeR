library(EnvStats)


### Name: eqevd
### Title: Estimate Quantiles of an Extreme Value (Gumbel) Distribution
### Aliases: eqevd
### Keywords: distribution htest

### ** Examples

  # Generate 20 observations from an extreme value distribution with 
  # parameters location=2 and scale=1, then estimate the parameters 
  # and estimate the 90'th percentile.
  # (Note: the call to set.seed simply allows you to reproduce this example.)

  set.seed(250) 
  dat <- revd(20, location = 2) 
  eqevd(dat, p = 0.9) 

  #Results of Distribution Parameter Estimation
  #--------------------------------------------
  #
  #Assumed Distribution:            Extreme Value
  #
  #Estimated Parameter(s):          location = 1.9684093
  #                                 scale    = 0.7481955
  #
  #Estimation Method:               mle
  #
  #Estimated Quantile(s):           90'th %ile = 3.652124
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



