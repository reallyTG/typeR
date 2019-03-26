library(EnvStats)


### Name: eqlogis
### Title: Estimate Quantiles of a Logistic Distribution
### Aliases: eqlogis
### Keywords: distribution htest

### ** Examples

  # Generate 20 observations from a logistic distribution with 
  # parameters location=0 and scale=1, then estimate the parameters 
  # and estimate the 90th percentile. 
  # (Note: the call to set.seed simply allows you to reproduce this example.)

  set.seed(250) 
  dat <- rlogis(20) 
  eqlogis(dat, p = 0.9) 

  #Results of Distribution Parameter Estimation
  #--------------------------------------------
  #
  #Assumed Distribution:            Logistic
  #
  #Estimated Parameter(s):          location = -0.2181845
  #                                 scale    =  0.8152793
  #
  #Estimation Method:               mle
  #
  #Estimated Quantile(s):           90'th %ile = 1.573167
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



