library(EnvStats)


### Name: enbinom
### Title: Estimate Probability Parameter of a Negative Binomial
###   Distribution
### Aliases: enbinom
### Keywords: distribution htest

### ** Examples

  # Generate an observation from a negative binomial distribution with 
  # parameters size=2 and prob=0.2, then estimate the parameter prob. 
  # Note: the call to set.seed simply allows you to reproduce this example. 
  # Also, the only parameter that is estimated is prob; the parameter 
  # size is supplied in the call to enbinom.  The parameter size is printed in 
  # order to show all of the parameters associated with the distribution.

  set.seed(250) 
  dat <- rnbinom(1, size = 2, prob = 0.2) 
  dat
  #[1] 5

  enbinom(dat, size = 2)
  #Results of Distribution Parameter Estimation
  #--------------------------------------------
  #
  #Assumed Distribution:            Negative Binomial
  #
  #Estimated Parameter(s):          size = 2.0000000
  #                                 prob = 0.2857143
  #
  #Estimation Method:               mle/mme for 'prob'
  #
  #Data:                            dat, 2
  #
  #Sample Size:                     1

  #----------

  # Generate 3 observations from negative binomial distributions with 
  # parameters size=c(2,3,4) and prob=0.2, then estimate the parameter 
  # prob using the mvue. 
  # (Note: the call to set.seed simply allows you to reproduce this example.)

  size.vec <- 2:4 
  set.seed(250) 
  dat <- rnbinom(3, size = size.vec, prob = 0.2) 
  dat 
  #[1]  5 19 12 

  enbinom(dat, size = size.vec, method = "mvue") 
  #Results of Distribution Parameter Estimation
  #--------------------------------------------
  #
  #Assumed Distribution:            Negative Binomial
  #
  #Estimated Parameter(s):          size = 9.0000000
  #                                 prob = 0.1818182
  #
  #Estimation Method:               mvue for 'prob'
  #
  #Data:                            dat, size.vec
  #
  #Sample Size:                     3

  #----------

  # Clean up
  #---------
  rm(dat)



