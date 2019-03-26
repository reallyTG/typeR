library(EnvStats)


### Name: epoisCensored
### Title: Estimate Mean of a Poisson Distribution Based on Type I Censored
###   Data
### Aliases: epoisCensored
### Keywords: distribution htest

### ** Examples

  # Generate 20 observations from a Poisson distribution with 
  # parameter lambda=10, and censor the values less than 10. 
  # Then generate 20 more observations from the same distribution 
  # and censor the values less than 20.  Then estimate the mean 
  # using the maximum likelihood method. 
  # (Note: the call to set.seed simply allows you to reproduce this example.)

  set.seed(300) 
  dat.1 <- rpois(20, lambda=10) 
  censored.1 <- dat.1 < 10 
  dat.1[censored.1] <- 10 

  dat.2 <- rpois(20, lambda=10) 
  censored.2 <- dat.2 < 20 
  dat.2[censored.2] <- 20 

  dat <- c(dat.1, dat.2) 
  censored <- c(censored.1, censored.2) 

  epoisCensored(dat, censored, ci = TRUE)

  #Results of Distribution Parameter Estimation
  #Based on Type I Censored Data
  #--------------------------------------------
  #
  #Assumed Distribution:            Poisson
  #
  #Censoring Side:                  left
  #
  #Censoring Level(s):              10 20 
  #
  #Estimated Parameter(s):          lambda = 11.05402
  #
  #Estimation Method:               MLE
  #
  #Data:                            dat
  #
  #Censoring Variable:              censored
  #
  #Sample Size:                     40
  #
  #Percent Censored:                65%
  #
  #Confidence Interval for:         lambda
  #
  #Confidence Interval Method:      Profile Likelihood
  #
  #Confidence Interval Type:        two-sided
  #
  #Confidence Level:                95%
  #
  #Confidence Interval:             LCL =  9.842894
  #                                 UCL = 12.846484

  #----------

  # Clean up
  #---------
  rm(dat.1, censored.1, dat.2, censored.2, dat, censored)



