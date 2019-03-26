library(EnvStats)


### Name: ezmnorm
### Title: Estimate Parameters of a Zero-Modified Normal Distribution
### Aliases: ezmnorm
### Keywords: distribution htest

### ** Examples

  # Generate 100 observations from a zero-modified normal distribution 
  # with mean=4, sd=2, and p.zero=0.5, then estimate the parameters.  
  # According to equations (1) and (2) above, the overall mean is 
  # mean.zmnorm=2 and the overall standard deviation is sd.zmnorm=sqrt(6).  
  # (Note: the call to set.seed simply allows you to reproduce this example.)

  set.seed(250) 
  dat <- rzmnorm(100, mean = 4, sd = 2, p.zero = 0.5) 
  ezmnorm(dat, ci = TRUE) 

  #Results of Distribution Parameter Estimation
  #--------------------------------------------
  #
  #Assumed Distribution:            Zero-Modified Normal
  #
  #Estimated Parameter(s):          mean        = 4.037732
  #                                 sd          = 1.917004
  #                                 p.zero      = 0.450000
  #                                 mean.zmnorm = 2.220753
  #                                 sd.zmnorm   = 2.465829
  #
  #Estimation Method:               mvue
  #
  #Data:                            dat
  #
  #Sample Size:                     100
  #
  #Confidence Interval for:         mean.zmnorm
  #
  #Confidence Interval Method:      Normal Approximation
  #                                 (t Distribution)
  #
  #Confidence Interval Type:        two-sided
  #
  #Confidence Level:                95%
  #
  #Confidence Interval:             LCL = 1.731417
  #                                 UCL = 2.710088

  #----------

  # Following Example 9 on page 34 of USEPA (1992c), compute an 
  # estimate of the mean of the zinc data, assuming a 
  # zero-modified normal distribution. The data are stored in 
  # EPA.92c.zinc.df.

  head(EPA.92c.zinc.df) 
  #  Zinc.orig  Zinc Censored Sample Well
  #1        <7  7.00     TRUE      1    1
  #2     11.41 11.41    FALSE      2    1
  #3        <7  7.00     TRUE      3    1
  #4        <7  7.00     TRUE      4    1
  #5        <7  7.00     TRUE      5    1
  #6     10.00 10.00    FALSE      6    1

  New.Zinc <- EPA.92c.zinc.df$Zinc 
  New.Zinc[EPA.92c.zinc.df$Censored] <- 0 
  ezmnorm(New.Zinc, ci = TRUE) 

  #Results of Distribution Parameter Estimation
  #--------------------------------------------
  #
  #Assumed Distribution:            Zero-Modified Normal
  #
  #Estimated Parameter(s):          mean        = 11.891000
  #                                 sd          =  1.594523
  #                                 p.zero      =  0.500000
  #                                 mean.zmnorm =  5.945500
  #                                 sd.zmnorm   =  6.123235
  #
  #Estimation Method:               mvue
  #
  #Data:                            New.Zinc
  #
  #Sample Size:                     40
  #
  #Confidence Interval for:         mean.zmnorm
  #
  #Confidence Interval Method:      Normal Approximation
  #                                 (t Distribution)
  #
  #Confidence Interval Type:        two-sided
  #
  #Confidence Level:                95%
  #
  #Confidence Interval:             LCL = 3.985545
  #                                 UCL = 7.905455

  #----------

  # Clean up
  rm(dat, New.Zinc)



