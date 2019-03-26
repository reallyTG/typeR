library(EnvStats)


### Name: eqpareto
### Title: Estimate Quantiles of a Pareto Distribution
### Aliases: eqpareto
### Keywords: distribution htest

### ** Examples

  # Generate 30 observations from a Pareto distribution with 
  # parameters location=1 and shape=1 then estimate the parameters 
  # and the 90'th percentile.
  # (Note: the call to set.seed simply allows you to reproduce this example.)

  set.seed(250) 
  dat <- rpareto(30, location = 1, shape = 1) 
  eqpareto(dat, p = 0.9) 

  #Results of Distribution Parameter Estimation
  #--------------------------------------------
  #
  #Assumed Distribution:            Pareto
  #
  #Estimated Parameter(s):          location = 1.009046
  #                                 shape    = 1.079850
  #
  #Estimation Method:               mle
  #
  #Estimated Quantile(s):           90'th %ile = 8.510708
  #
  #Quantile Estimation Method:      Quantile(s) Based on
  #                                 mle Estimators
  #
  #Data:                            dat
  #
  #Sample Size:                     30

  #----------

  # Clean up
  #---------
  rm(dat)



