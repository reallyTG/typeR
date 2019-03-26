library(EnvStats)


### Name: eqlnorm
### Title: Estimate Quantiles of a Lognormal Distribution
### Aliases: eqlnorm
### Keywords: distribution htest

### ** Examples

  # Generate 20 observations from a lognormal distribution with 
  # parameters meanlog=3 and sdlog=0.5, then estimate the 90th 
  # percentile and create a one-sided upper 95% confidence interval 
  # for that percentile. 
  # (Note: the call to set.seed simply allows you to reproduce this 
  # example.)

  set.seed(47) 
  dat <- rlnorm(20, meanlog = 3, sdlog = 0.5) 
  eqlnorm(dat, p = 0.9, ci = TRUE, ci.type = "upper")

  #Results of Distribution Parameter Estimation
  #--------------------------------------------
  #
  #Assumed Distribution:            Lognormal
  #
  #Estimated Parameter(s):          meanlog = 2.9482139
  #                                 sdlog   = 0.4553215
  #
  #Estimation Method:               mvue
  #
  #Estimated Quantile(s):           90'th %ile = 34.18312
  #
  #Quantile Estimation Method:      qmle
  #
  #Data:                            dat
  #
  #Sample Size:                     20
  #
  #Confidence Interval for:         90'th %ile
  #
  #Confidence Interval Method:      Exact
  #
  #Confidence Interval Type:        upper
  #
  #Confidence Level:                95%
  #
  #Confidence Interval:             LCL =  0.00000
  #                                 UCL = 45.84008

  #----------
  # Compare these results with the true 90'th percentile:

  qlnorm(p = 0.9, meanlog = 3, sdlog = 0.5)
  #[1] 38.1214

  #----------

  # Clean up
  rm(dat)
  
  #--------------------------------------------------------------------

  # Example 17-3 of USEPA (2009, p. 17-17) shows how to construct a 
  # beta-content upper tolerance limit with 95% coverage and 95% 
  # confidence using chrysene data and assuming a lognormal 
  # distribution.

  # A beta-content upper tolerance limit with 95% coverage and 95% 
  # confidence is equivalent to the 95% upper confidence limit for the 
  # 95th percentile.

  attach(EPA.09.Ex.17.3.chrysene.df)
  Chrysene <- Chrysene.ppb[Well.type == "Background"]
  eqlnorm(Chrysene, p = 0.95, ci = TRUE, ci.type = "upper")

  #Results of Distribution Parameter Estimation
  #--------------------------------------------
  #
  #Assumed Distribution:            Lognormal
  #
  #Estimated Parameter(s):          meanlog = 2.5085773
  #                                 sdlog   = 0.6279479
  #
  #Estimation Method:               mvue
  #
  #Estimated Quantile(s):           95'th %ile = 34.51727
  #
  #Quantile Estimation Method:      qmle
  #
  #Data:                            Chrysene
  #
  #Sample Size:                     8
  #
  #Confidence Interval for:         95'th %ile
  #
  #Confidence Interval Method:      Exact
  #
  #Confidence Interval Type:        upper
  #
  #Confidence Level:                95%
  #
  #Confidence Interval:             LCL =  0.0000
  #                                 UCL = 90.9247

  #----------
  # Clean up

  rm(Chrysene)
  detach("EPA.09.Ex.17.3.chrysene.df")



