library(EnvStats)


### Name: tolIntPois
### Title: Tolerance Interval for a Poisson Distribution
### Aliases: tolIntPois
### Keywords: distribution htest

### ** Examples

  # Generate 20 observations from a Poisson distribution with parameter 
  # lambda=2. The interval [0, 4] contains 94.7% of this distribution and 
  # the interval [0,5] contains 98.3% of this distribution.  Thus, because 
  # of the discrete nature of the Poisson distribution, no interval contains 
  # exactly 95% of this distribution.  Use tolIntPois to estimate the mean 
  # parameter of the true distribution, and construct a one-sided upper 95% 
  # beta-content tolerance interval with associated confidence level 90%. 
  # (Note: the call to set.seed simply allows you to reproduce this example.)

  set.seed(250) 
  dat <- rpois(20, 2) 
  tolIntPois(dat, conf.level = 0.9)

  #Results of Distribution Parameter Estimation
  #--------------------------------------------
  #
  #Assumed Distribution:            Poisson
  #
  #Estimated Parameter(s):          lambda = 1.8
  #
  #Estimation Method:               mle/mme/mvue
  #
  #Data:                            dat
  #
  #Sample Size:                     20
  #
  #Tolerance Interval Coverage:     95%
  #
  #Coverage Type:                   content
  #
  #Tolerance Interval Method:       Zacks
  #
  #Tolerance Interval Type:         two-sided
  #
  #Confidence Level:                90%
  #
  #Tolerance Interval:              LTL = 0
  #                                 UTL = 6

  #------

  # Clean up
  rm(dat)



