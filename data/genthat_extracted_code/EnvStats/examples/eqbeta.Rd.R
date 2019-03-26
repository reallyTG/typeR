library(EnvStats)


### Name: eqbeta
### Title: Estimate Quantiles of a Beta Distribution
### Aliases: eqbeta
### Keywords: distribution htest

### ** Examples

  # Generate 20 observations from a beta distribution with parameters 
  # shape1=2 and shape2=4, then estimate the parameters via 
  # maximum likelihood and estimate the 90'th percentile.
  # (Note: the call to set.seed simply allows you to reproduce this example.)

  set.seed(250) 
  dat <- rbeta(20, shape1 = 2, shape2 = 4) 
  eqbeta(dat, p = 0.9)

  #Results of Distribution Parameter Estimation
  #--------------------------------------------
  #
  #Assumed Distribution:            Beta
  #
  #Estimated Parameter(s):          shape1 =  5.392221
  #                                 shape2 = 11.823233
  #
  #Estimation Method:               mle
  #
  #Estimated Quantile(s):           90'th %ile = 0.4592796
  #
  #Quantile Estimation Method:      Quantile(s) Based on
  #                                 mle Estimators
  #
  #Data:                            dat
  #
  #Sample Size:                     20

  #----------
  # Clean up

  rm(dat)



