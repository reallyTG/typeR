library(EnvStats)


### Name: eunif
### Title: Estimate Parameters of a Uniform Distribution
### Aliases: eunif
### Keywords: distribution htest

### ** Examples

  # Generate 20 observations from a uniform distribution with parameters 
  # min=-2 and max=3, then estimate the parameters via maximum likelihood. 
  # (Note: the call to set.seed simply allows you to reproduce this example.)

  set.seed(250) 
  dat <- runif(20, min = -2, max = 3) 
  eunif(dat) 

  #Results of Distribution Parameter Estimation
  #--------------------------------------------
  #
  #Assumed Distribution:            Uniform
  #
  #Estimated Parameter(s):          min = -1.574529
  #                                 max =  2.837006
  #
  #Estimation Method:               mle
  #
  #Data:                            dat
  #
  #Sample Size:                     20

  #----------

  # Compare the three methods of estimation:

  eunif(dat, method = "mle")$parameters 
  #      min       max 
  #-1.574529  2.837006 
 
 
  eunif(dat, method = "mme")$parameters 
  #      min       max 
  #-1.988462  2.650737 
 
 
  eunif(dat, method = "mmue")$parameters 
  #      min       max 
  #-2.048721  2.710996 

  #----------

  # Clean up
  #---------
  rm(dat)



