library(EnvStats)


### Name: eqhyper
### Title: Estimate Quantiles of a Hypergeometric Distribution
### Aliases: eqhyper
### Keywords: distribution htest

### ** Examples

  # Generate an observation from a hypergeometric distribution with 
  # parameters m=10, n=30, and k=5, then estimate the parameter m, and
  # the 80'th percentile. 
  # Note: the call to set.seed simply allows you to reproduce this example. 
  # Also, the only parameter actually estimated is m; once m is estimated, 
  # n is computed by subtracting the estimated value of m (8 in this example) 
  # from the given of value of m+n (40 in this example).  The parameters 
  # n and k are shown in the output in order to provide information on 
  # all of the parameters associated with the hypergeometric distribution.

  set.seed(250) 
  dat <- rhyper(nn = 1, m = 10, n = 30, k = 5) 
  dat 
  #[1] 1   

  eqhyper(dat, total = 40, k = 5, p = 0.8) 

  #Results of Distribution Parameter Estimation
  #--------------------------------------------
  #
  #Assumed Distribution:            Hypergeometric
  #
  #Estimated Parameter(s):          m =  8
  #                                 n = 32
  #                                 k =  5
  #
  #Estimation Method:               mle for 'm'
  #
  #Estimated Quantile(s):           80'th %ile = 2
  #
  #Quantile Estimation Method:      Quantile(s) Based on
  #                                 mle for 'm' Estimators
  #
  #Data:                            dat
  #
  #Sample Size:                     1

  #----------

  # Clean up
  #---------
  rm(dat)



