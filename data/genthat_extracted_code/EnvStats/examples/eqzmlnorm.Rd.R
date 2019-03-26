library(EnvStats)


### Name: eqzmlnorm
### Title: Estimate Quantiles of a Zero-Modified Lognormal (Delta)
###   Distribution
### Aliases: eqzmlnorm eqzmlnormAlt
### Keywords: distribution htest

### ** Examples

  # Generate 100 observations from a zero-modified lognormal (delta) 
  # distribution with mean=2, cv=1, and p.zero=0.5, then estimate the 
  # parameters and also the 80'th and 90'th percentiles.  
  # (Note: the call to set.seed simply allows you to reproduce this example.)

  set.seed(250) 
  dat <- rzmlnormAlt(100, mean = 2, cv = 1, p.zero = 0.5) 
  eqzmlnormAlt(dat, p = c(0.8, 0.9)) 

  #Results of Distribution Parameter Estimation
  #--------------------------------------------
  #
  #Assumed Distribution:            Zero-Modified Lognormal (Delta)
  #
  #Estimated Parameter(s):          mean         = 1.9604561
  #                                 cv           = 0.9169411
  #                                 p.zero       = 0.4500000
  #                                 mean.zmlnorm = 1.0782508
  #                                 cv.zmlnorm   = 1.5307175
  #
  #Estimation Method:               mvue
  #
  #Estimated Quantile(s):           80'th %ile = 1.897451
  #                                 90'th %ile = 2.937976
  #
  #Quantile Estimation Method:      Quantile(s) Based on
  #                                 mvue Estimators
  #
  #Data:                            dat
  #
  #Sample Size:                     100

  #----------

  # Compare the estimated quatiles with the true quantiles

  qzmlnormAlt(mean = 2, cv = 1, p.zero = 0.5, p = c(0.8, 0.9))
  #[1] 1.746299 2.849858

  #----------

  # Clean up
  rm(dat)



