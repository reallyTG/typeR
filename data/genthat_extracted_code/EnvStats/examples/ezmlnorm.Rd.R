library(EnvStats)


### Name: ezmlnorm
### Title: Estimate Parameters of a Zero-Modified Lognormal (Delta)
###   Distribution
### Aliases: ezmlnorm ezmlnormAlt
### Keywords: distribution htest

### ** Examples

  # Generate 100 observations from a zero-modified lognormal (delta) 
  # distribution with mean=2, cv=1, and p.zero=0.5, then estimate the 
  # parameters. According to equations (1) and (3) above, the overall mean 
  # is mean.zmlnorm=1 and the overall cv is cv.zmlnorm=sqrt(3). 
  # (Note: the call to set.seed simply allows you to reproduce this example.)

  set.seed(250) 
  dat <- rzmlnormAlt(100, mean = 2, cv = 1, p.zero = 0.5) 
  ezmlnormAlt(dat, ci = TRUE) 

  #Results of Distribution Parameter Estimation
  #--------------------------------------------
  #
  #Assumed Distribution:            Zero-Modified Lognormal (Delta)
  #
  #Estimated Parameter(s):          mean         = 1.9604561
  #                                 cv           = 0.9169411
  #                                 p.zero       = 0.4500000
  #                                 mean.zmlnorm = 1.0782508
  #                                 cv.zmlnorm   = 1.5307175
  #
  #Estimation Method:               mvue
  #
  #Data:                            dat
  #
  #Sample Size:                     100
  #
  #Confidence Interval for:         mean.zmlnorm
  #
  #Confidence Interval Method:      Normal Approximation
  #                                 (t Distribution)
  #
  #Confidence Interval Type:        two-sided
  #
  #Confidence Level:                95%
  #
  #Confidence Interval:             LCL = 0.748134
  #                                 UCL = 1.408368

  #----------

  # Clean up
  rm(dat)



