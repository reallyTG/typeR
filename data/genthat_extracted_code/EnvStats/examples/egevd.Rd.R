library(EnvStats)


### Name: egevd
### Title: Estimate Parameters of a Generalized Extreme Value Distribution
### Aliases: egevd
### Keywords: distribution htest

### ** Examples

  # Generate 20 observations from a generalized extreme value distribution 
  # with parameters location=2, scale=1, and shape=0.2, then compute the 
  # MLE and construct a 90% confidence interval for the location parameter. 
  # (Note: the call to set.seed simply allows you to reproduce this example.)

  set.seed(498) 
  dat <- rgevd(20, location = 2, scale = 1, shape = 0.2) 
  egevd(dat, ci = TRUE, conf.level = 0.9)

  #Results of Distribution Parameter Estimation
  #--------------------------------------------
  #
  #Assumed Distribution:            Generalized Extreme Value
  #
  #Estimated Parameter(s):          location = 1.6144631
  #                                 scale    = 0.9867007
  #                                 shape    = 0.2632493
  #
  #Estimation Method:               mle
  #
  #Data:                            dat
  #
  #Sample Size:                     20
  #
  #Confidence Interval for:         location
  #
  #Confidence Interval Method:      Normal Approximation
  #                                 (t Distribution) based on
  #                                 observed information
  #
  #Confidence Interval Type:        two-sided
  #
  #Confidence Level:                90%
  #
  #Confidence Interval:             LCL = 1.225249
  #                                 UCL = 2.003677

  #----------

  # Compare the values of the different types of estimators:

  egevd(dat, method = "mle")$parameters 
  # location     scale     shape 
  #1.6144631 0.9867007 0.2632493 

  egevd(dat, method = "pwme")$parameters
  # location     scale     shape 
  #1.5785779 1.0187880 0.2257948 

  egevd(dat, method = "pwme", pwme.method = "plotting.position")$parameters 
  # location     scale     shape 
  #1.5509183 0.9804992 0.1657040

  egevd(dat, method = "tsoe")$parameters 
  # location     scale     shape 
  #1.5372694 1.0876041 0.2927272 

  egevd(dat, method = "tsoe", tsoe.method = "lms")$parameters 
  #location    scale    shape 
  #1.519469 1.081149 0.284863

  egevd(dat, method = "tsoe", tsoe.method = "lts")$parameters 
  # location     scale     shape 
  #1.4840198 1.0679549 0.2691914 

  #----------

  # Clean up
  #---------
  rm(dat)



