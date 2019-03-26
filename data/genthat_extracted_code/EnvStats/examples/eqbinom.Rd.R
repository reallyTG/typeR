library(EnvStats)


### Name: eqbinom
### Title: Estimate Quantiles of a Binomial Distribution
### Aliases: eqbinom
### Keywords: distribution htest

### ** Examples

  # Generate 20 observations from a binomial distribution with 
  # parameters size=1 and prob=0.2, then estimate the 'prob' 
  # parameter and the 90'th percentile. 
  # (Note: the call to set.seed simply allows you to reproduce this example. 

  set.seed(251) 
  dat <- rbinom(20, size = 1, prob = 0.2) 
  eqbinom(dat, p = 0.9) 

  #Results of Distribution Parameter Estimation
  #--------------------------------------------
  #
  #Assumed Distribution:            Binomial
  #
  #Estimated Parameter(s):          size = 20.0
  #                                 prob =  0.1
  #
  #Estimation Method:               mle/mme/mvue for 'prob'
  #
  #Estimated Quantile(s):           90'th %ile = 4
  #
  #Quantile Estimation Method:      Quantile(s) Based on
  #                                 mle/mme/mvue for 'prob' Estimators
  #
  #Data:                            dat
  #
  #Sample Size:                     20
  #
  #
  #

  #----------
  # Clean up

  rm(dat)



