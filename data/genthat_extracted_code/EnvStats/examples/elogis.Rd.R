library(EnvStats)


### Name: elogis
### Title: Estimate Parameters of a Logistic Distribution
### Aliases: elogis
### Keywords: distribution htest

### ** Examples

  # Generate 20 observations from a logistic distribution with 
  # parameters location=0 and scale=1, then estimate the parameters 
  # and construct a 90% confidence interval for the location parameter. 
  # (Note: the call to set.seed simply allows you to reproduce this example.)

  set.seed(250) 
  dat <- rlogis(20) 
  elogis(dat, ci = TRUE, conf.level = 0.9) 

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
  #Data:                            dat
  #
  #Sample Size:                     20
  #
  #Confidence Interval for:         location
  #
  #Confidence Interval Method:      Normal Approximation
  #                                 (t Distribution)
  #
  #Confidence Interval Type:        two-sided
  #
  #Confidence Level:                90%
  #
  #Confidence Interval:             LCL = -0.7899382
  #                                 UCL =  0.3535693
  
  #----------

  # Clean up
  #---------
  rm(dat)



