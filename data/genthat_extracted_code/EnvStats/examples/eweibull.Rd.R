library(EnvStats)


### Name: eweibull
### Title: Estimate Parameters of a Weibull Distribution
### Aliases: eweibull
### Keywords: distribution htest

### ** Examples

  # Generate 20 observations from a Weibull distribution with parameters 
  # shape=2 and scale=3, then estimate the parameters via maximum likelihood. 
  # (Note: the call to set.seed simply allows you to reproduce this example.)

  set.seed(250) 
  dat <- rweibull(20, shape = 2, scale = 3) 
  eweibull(dat) 

  #Results of Distribution Parameter Estimation
  #--------------------------------------------
  #
  #Assumed Distribution:            Weibull
  #
  #Estimated Parameter(s):          shape = 2.673098
  #                                 scale = 3.047762
  #
  #Estimation Method:               mle
  #
  #Data:                            dat
  #
  #Sample Size:                     20

  #----------

  # Use the same data as in previous example, and compute the method of 
  # moments estimators based on the unbiased estimator of variance:

  eweibull(dat, method = "mmue") 

  #Results of Distribution Parameter Estimation
  #--------------------------------------------
  #
  #Assumed Distribution:            Weibull
  #
  #Estimated Parameter(s):          shape = 2.528377
  #                                 scale = 3.052507
  #
  #Estimation Method:               mmue
  #
  #Data:                            dat
  #
  #Sample Size:                     20

  #----------

  # Clean up
  #---------
  rm(dat)



