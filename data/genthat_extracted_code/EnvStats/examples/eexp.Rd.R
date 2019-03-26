library(EnvStats)


### Name: eexp
### Title: Estimate Rate Parameter of an Exponential Distribution
### Aliases: eexp
### Keywords: distribution htest

### ** Examples

  # Generate 20 observations from an exponential distribution with parameter 
  # rate=2, then estimate the parameter and construct a 90% confidence interval. 
  # (Note: the call to set.seed simply allows you to reproduce this example.)

  set.seed(250) 
  dat <- rexp(20, rate = 2) 
  eexp(dat, ci=TRUE, conf = 0.9) 

  #Results of Distribution Parameter Estimation
  #--------------------------------------------
  #
  #Assumed Distribution:            Exponential
  #
  #Estimated Parameter(s):          rate = 2.260587
  #
  #Estimation Method:               mle/mme
  #
  #Data:                            dat
  #
  #Sample Size:                     20
  #
  #Confidence Interval for:         rate
  #
  #Confidence Interval Method:      Exact
  #
  #Confidence Interval Type:        two-sided
  #
  #Confidence Level:                90%
  #
  #Confidence Interval:             LCL = 1.498165
  #                                 UCL = 3.151173

  #----------

  # Clean up
  #---------
  rm(dat)



