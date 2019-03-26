library(EnvStats)


### Name: eqlnorm3
### Title: Estimate Quantiles of a Three-Parameter Lognormal Distribution
### Aliases: eqlnorm3
### Keywords: distribution htest

### ** Examples

  # Generate 20 observations from a 3-parameter lognormal distribution 
  # with parameters meanlog=1.5, sdlog=1, and threshold=10, then use 
  # Cohen and Whitten's (1980) modified moments estimators to estimate 
  # the parameters, and estimate the 90th percentile. 
  # (Note: the call to set.seed simply allows you to reproduce this example.)

  set.seed(250) 
  dat <- rlnorm3(20, meanlog = 1.5, sdlog = 1, threshold = 10) 
  eqlnorm3(dat, method = "mmme", p = 0.9)

  #Results of Distribution Parameter Estimation
  #--------------------------------------------
  #
  #Assumed Distribution:            3-Parameter Lognormal
  #
  #Estimated Parameter(s):          meanlog   = 1.5206664
  #                                 sdlog     = 0.5330974
  #                                 threshold = 9.6620403
  #
  #Estimation Method:               mmme
  #
  #Estimated Quantile(s):           90'th %ile = 18.72194
  #
  #Quantile Estimation Method:      Quantile(s) Based on
  #                                 mmme Estimators
  #
  #Data:                            dat
  #
  #Sample Size:                     20

  # Clean up
  #---------
  rm(dat)



