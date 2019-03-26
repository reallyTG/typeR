library(EnvStats)


### Name: epois
### Title: Estimate Parameter of a Poisson Distribution
### Aliases: epois
### Keywords: distribution htest

### ** Examples

  # Generate 20 observations from a Poisson distribution with parameter 
  # lambda=2, then estimate the parameter and construct a 90% confidence 
  # interval. 
  # (Note: the call to set.seed simply allows you to reproduce this example.)

  set.seed(250) 
  dat <- rpois(20, lambda = 2) 
  epois(dat, ci = TRUE, conf.level = 0.9) 

  #Results of Distribution Parameter Estimation
  #--------------------------------------------
  #
  #Assumed Distribution:            Poisson
  #
  #Estimated Parameter(s):          lambda = 1.8
  #
  #Estimation Method:               mle/mme/mvue
  #
  #Data:                            dat
  #
  #Sample Size:                     20
  #
  #Confidence Interval for:         lambda
  #
  #Confidence Interval Method:      exact
  #
  #Confidence Interval Type:        two-sided
  #
  #Confidence Level:                90%
  #
  #Confidence Interval:             LCL = 1.336558
  #                                 UCL = 2.377037

  #----------

  # Compare the different ways of constructing confidence intervals for 
  # lambda using the same data as in the previous example:

  epois(dat, ci = TRUE, ci.method = "pearson", 
    conf.level = 0.9)$interval$limits 
  #     LCL      UCL 
  #1.336558 2.377037

  epois(dat, ci = TRUE, ci.method = "normal.approx",  
    conf.level = 0.9)$interval$limits 
  #     LCL      UCL 
  #1.306544 2.293456 

  #----------

  # Clean up
  #---------

  rm(dat)



