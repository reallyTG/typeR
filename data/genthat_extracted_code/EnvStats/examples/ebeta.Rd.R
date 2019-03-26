library(EnvStats)


### Name: ebeta
### Title: Estimate Parameters of a Beta Distribution
### Aliases: ebeta
### Keywords: distribution htest

### ** Examples

  # Generate 20 observations from a beta distribution with parameters 
  # shape1=2 and shape2=4, then estimate the parameters via 
  # maximum likelihood. 
  # (Note: the call to set.seed simply allows you to reproduce this example.)

  set.seed(250) 
  dat <- rbeta(20, shape1 = 2, shape2 = 4) 
  ebeta(dat) 

  #Results of Distribution Parameter Estimation
  #--------------------------------------------
  #
  #Assumed Distribution:            Beta
  #
  #Estimated Parameter(s):          shape1 =  5.392221
  #                                 shape2 = 11.823233
  #
  #Estimation Method:               mle
  #
  #Data:                            dat
  #
  #Sample Size:                     20

  #==========

  # Repeat the above, but use the method of moments estimators:

  ebeta(dat, method = "mme")

  #Results of Distribution Parameter Estimation
  #--------------------------------------------
  #
  #Assumed Distribution:            Beta
  #
  #Estimated Parameter(s):          shape1 =  5.216311
  #                                 shape2 = 11.461341
  #
  #Estimation Method:               mme
  #
  #Data:                            dat
  #
  #Sample Size:                     20

  #==========

  # Clean up
  #---------
  rm(dat)



