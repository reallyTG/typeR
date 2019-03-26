library(EnvStats)


### Name: egeom
### Title: Estimate Probability Parameter of a Geometric Distribution
### Aliases: egeom
### Keywords: distribution htest

### ** Examples

  # Generate an observation from a geometric distribution with parameter 
  # prob=0.2, then estimate the parameter prob. 
  # (Note: the call to set.seed simply allows you to reproduce this example.)

  set.seed(250) 
  dat <- rgeom(1, prob = 0.2) 
  dat 
  #[1] 4 

  egeom(dat)
  #Results of Distribution Parameter Estimation
  #--------------------------------------------
  #
  #Assumed Distribution:            Geometric
  #
  #Estimated Parameter(s):          prob = 0.2
  #
  #Estimation Method:               mle/mme
  #
  #Data:                            dat
  #
  #Sample Size:                     1

  #----------

  # Generate 3 observations from a geometric distribution with parameter 
  # prob=0.2, then estimate the parameter prob with the mvue. 
  # (Note: the call to set.seed simply allows you to reproduce this example.)

  set.seed(200) 
  dat <- rgeom(3, prob = 0.2) 
  dat 
  #[1] 0 1 2 

  egeom(dat, method = "mvue") 
  #Results of Distribution Parameter Estimation
  #--------------------------------------------
  #
  #Assumed Distribution:            Geometric
  #
  #Estimated Parameter(s):          prob = 0.4
  #
  #Estimation Method:               mvue
  #
  #Data:                            dat
  #
  #Sample Size:                     3

  #----------

  # Clean up
  #---------
  rm(dat)



