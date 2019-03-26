library(EnvStats)


### Name: eqpois
### Title: Estimate Quantiles of a Poisson Distribution
### Aliases: eqpois
### Keywords: distribution htest

### ** Examples

  # Generate 20 observations from a Poisson distribution with parameter 
  # lambda=2.  The true 90'th percentile of this distribution is 4 (actually, 
  # 4 is the p'th quantile for any value of p between 0.86 and 0.947).  
  # Here we will use eqpois to estimate the 90'th percentile and construct a 
  # two-sided 95% confidence interval for this percentile. 
  # (Note: the call to set.seed simply allows you to reproduce this example.)

  set.seed(250) 
  dat <- rpois(20, lambda = 2) 
  eqpois(dat, p = 0.9, ci = TRUE)

  #Results of Distribution Parameter Estimation
  #--------------------------------------------
  #
  #Assumed Distribution:            Poisson
  #
  #Estimated Parameter(s):          lambda = 1.8
  #
  #Estimation Method:               mle/mme/mvue
  #
  #Estimated Quantile(s):           90'th %ile = 4
  #
  #Quantile Estimation Method:      mle
  #
  #Data:                            dat
  #
  #Sample Size:                     20
  #
  #Confidence Interval for:         90'th %ile
  #
  #Confidence Interval Method:      Exact
  #
  #Confidence Interval Type:        two-sided
  #
  #Confidence Level:                95%
  #
  #Confidence Interval:             LCL = 3
  #                                 UCL = 5

  # Clean up
  #---------
  rm(dat)



