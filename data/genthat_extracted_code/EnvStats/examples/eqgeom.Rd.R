library(EnvStats)


### Name: eqgeom
### Title: Estimate Quantiles of a Geometric Distribution
### Aliases: eqgeom
### Keywords: distribution htest

### ** Examples

  # Generate an observation from a geometric distribution with parameter 
  # prob=0.2, then estimate the parameter prob and the 90'th percentile. 
  # (Note: the call to set.seed simply allows you to reproduce this example.)

  set.seed(250) 
  dat <- rgeom(1, prob = 0.2) 
  dat 
  #[1] 4 

  eqgeom(dat, p = 0.9)

  #Results of Distribution Parameter Estimation
  #--------------------------------------------
  #
  #Assumed Distribution:            Geometric
  #
  #Estimated Parameter(s):          prob = 0.2
  #
  #Estimation Method:               mle/mme
  #
  #Estimated Quantile(s):           90'th %ile = 10
  #
  #Quantile Estimation Method:      Quantile(s) Based on
  #                                 mle/mme Estimators
  #
  #Data:                            dat
  #
  #Sample Size:                     1

  #----------

  # Clean up
  #---------
  rm(dat)



