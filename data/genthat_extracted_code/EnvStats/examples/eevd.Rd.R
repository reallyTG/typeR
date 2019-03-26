library(EnvStats)


### Name: eevd
### Title: Estimate Parameters of an Extreme Value (Gumbel) Distribution
### Aliases: eevd
### Keywords: distribution htest

### ** Examples

  # Generate 20 observations from an extreme value distribution with 
  # parameters location=2 and scale=1, then estimate the parameters 
  # and construct a 90% confidence interval for the location parameter. 
  # (Note: the call to set.seed simply allows you to reproduce this example.)

  set.seed(250) 
  dat <- revd(20, location = 2) 
  eevd(dat, ci = TRUE, conf.level = 0.9) 

  #Results of Distribution Parameter Estimation
  #--------------------------------------------
  #
  #Assumed Distribution:            Extreme Value
  #
  #Estimated Parameter(s):          location = 1.9684093
  #                                 scale    = 0.7481955
  #
  #Estimation Method:               mle
  #
  #Data:                            dat
  #
  #Sample Size:                     20
  #
  #Confidence Interval for:         location
  #
  #Confidence Interval Method:      Normal Approximation
  #                                 (t Distribution)
  #
  #Confidence Interval Type:        two-sided
  #
  #Confidence Level:                90%
  #
  #Confidence Interval:             LCL = 1.663809
  #                                 UCL = 2.273009

  #----------

  #Compare the values of the different types of estimators: 

  eevd(dat, method = "mle")$parameters 
  # location     scale 
  #1.9684093 0.7481955

  eevd(dat, method = "mme")$parameters 
  # location     scale 
  #1.9575980 0.8339256 

  eevd(dat, method = "mmue")$parameters 
  # location     scale 
  #1.9450932 0.8555896 

  eevd(dat, method = "pwme")$parameters 
  # location     scale 
  #1.9434922 0.8583633

  #----------

  # Clean up
  #---------
  rm(dat)



