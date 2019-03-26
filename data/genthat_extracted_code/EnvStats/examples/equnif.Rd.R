library(EnvStats)


### Name: equnif
### Title: Estimate Quantiles of a Uniform Distribution
### Aliases: equnif
### Keywords: distribution htest

### ** Examples

  # Generate 20 observations from a uniform distribution with parameters 
  # min=-2 and max=3, then estimate the parameters via maximum likelihood
  # and estimate the 90th percentile. 
  # (Note: the call to set.seed simply allows you to reproduce this example.)

  set.seed(250) 
  dat <- runif(20, min = -2, max = 3) 
  equnif(dat, p = 0.9) 

  #Results of Distribution Parameter Estimation
  #--------------------------------------------
  #
  #Assumed Distribution:            Uniform
  #
  #Estimated Parameter(s):          min = -1.574529
  #                                 max =  2.837006
  #
  #Estimation Method:               mle
  #
  #Estimated Quantile(s):           90'th %ile = 2.395852
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



