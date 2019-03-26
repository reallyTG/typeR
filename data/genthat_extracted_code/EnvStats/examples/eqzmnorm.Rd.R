library(EnvStats)


### Name: eqzmnorm
### Title: Estimate Quantiles of a Zero-Modified Normal Distribution
### Aliases: eqzmnorm
### Keywords: distribution htest

### ** Examples

  # Generate 100 observations from a zero-modified normal distribution 
  # with mean=4, sd=2, and p.zero=0.5, then estimate the parameters and 
  # the 80th and 90th percentiles.  
  # (Note: the call to set.seed simply allows you to reproduce this example.)

  set.seed(250) 
  dat <- rzmnorm(100, mean = 4, sd = 2, p.zero = 0.5) 
  eqzmnorm(dat, p = c(0.8, 0.9)) 

  #Results of Distribution Parameter Estimation
  #--------------------------------------------
  #
  #Assumed Distribution:            Zero-Modified Normal
  #
  #Estimated Parameter(s):          mean        = 4.037732
  #                                 sd          = 1.917004
  #                                 p.zero      = 0.450000
  #                                 mean.zmnorm = 2.220753
  #                                 sd.zmnorm   = 2.465829
  #
  #Estimation Method:               mvue
  #
  #Estimated Quantile(s):           80'th %ile = 4.706298
  #                                 90'th %ile = 5.779250
  #
  #Quantile Estimation Method:      Quantile(s) Based on
  #                                 mvue Estimators
  #
  #Data:                            dat
  #
  #Sample Size:                     100

  #----------

  # Compare the estimated quantiles with the true quantiles

  qzmnorm(mean = 4, sd = 2, p.zero = 0.5, p = c(0.8, 0.9))
  #[1] 4.506694 5.683242

  #----------

  # Clean up
  rm(dat)



