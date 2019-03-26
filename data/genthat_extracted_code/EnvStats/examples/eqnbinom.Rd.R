library(EnvStats)


### Name: eqnbinom
### Title: Estimate Quantiles of a Negative Binomial Distribution
### Aliases: eqnbinom
### Keywords: distribution htest

### ** Examples

  # Generate an observation from a negative binomial distribution with 
  # parameters size=2 and prob=0.2, then estimate the parameter prob 
  # and the 90th percentile. 
  # Note: the call to set.seed simply allows you to reproduce this example. 
  # Also, the only parameter that is estimated is prob; the parameter 
  # size is supplied in the call to enbinom.  The parameter size is printed in 
  # order to show all of the parameters associated with the distribution.

  set.seed(250) 
  dat <- rnbinom(1, size = 2, prob = 0.2) 
  dat
  #[1] 5

  eqnbinom(dat, size = 2, p = 0.9)

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
  #Estimated Quantile(s):           90'th %ile = 11
  #
  #Quantile Estimation Method:      Quantile(s) Based on
  #                                 mle/mme for 'prob' Estimators
  #
  #Data:                            dat, 2
  #
  #Sample Size:                     1


  #----------
  # Clean up

  rm(dat)



