library(EnvStats)


### Name: epareto
### Title: Estimate Parameters of a Pareto Distribution
### Aliases: epareto
### Keywords: distribution htest

### ** Examples

  # Generate 30 observations from a Pareto distribution with parameters 
  # location=1 and shape=1 then estimate the parameters. 
  # (Note: the call to set.seed simply allows you to reproduce this example.)

  set.seed(250) 
  dat <- rpareto(30, location = 1, shape = 1) 
  epareto(dat) 

  #Results of Distribution Parameter Estimation
  #--------------------------------------------
  #
  #Assumed Distribution:            Pareto
  #
  #Estimated Parameter(s):          location = 1.009046
  #                                 shape    = 1.079850
  #
  #Estimation Method:               mle
  #
  #Data:                            dat
  #
  #Sample Size:                     30

  #----------

  # Compare the results of using the least-squares estimators:

  epareto(dat, method="lse")$parameters 
  #location    shape 
  #1.085924 1.144180

  #----------

  # Clean up
  #---------

  rm(dat)



