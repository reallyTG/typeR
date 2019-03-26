library(EnvStats)


### Name: eqgamma
### Title: Estimate Quantiles of a Gamma Distribution
### Aliases: eqgamma eqgammaAlt
### Keywords: distribution htest

### ** Examples

  # Generate 20 observations from a gamma distribution with parameters 
  # shape=3 and scale=2, then estimate the 90th percentile and create 
  # a one-sided upper 95% confidence interval for that percentile. 
  # (Note: the call to set.seed simply allows you to reproduce this 
  # example.)

  set.seed(250) 
  dat <- rgamma(20, shape = 3, scale = 2) 
  eqgamma(dat, p = 0.9, ci = TRUE, ci.type = "upper")

  #Results of Distribution Parameter Estimation
  #--------------------------------------------
  #
  #Assumed Distribution:            Gamma
  #
  #Estimated Parameter(s):          shape = 2.203862
  #                                 scale = 2.174928
  #
  #Estimation Method:               mle
  #
  #Estimated Quantile(s):           90'th %ile = 9.113446
  #
  #Quantile Estimation Method:      Quantile(s) Based on
  #                                 mle Estimators
  #
  #Data:                            dat
  #
  #Sample Size:                     20
  #
  #Confidence Interval for:         90'th %ile
  #
  #Confidence Interval Method:      Exact using
  #                                 Kulkarni & Powar (2010)
  #                                 transformation to Normality
  #                                 based on mle of 'shape'
  #
  #Confidence Interval Type:        upper
  #
  #Confidence Level:                95%
  #
  #Confidence Interval:             LCL =  0.00000
  #                                 UCL = 13.79733

  #----------
  # Compare these results with the true 90'th percentile:

  qgamma(p = 0.9, shape = 3, scale = 2)
  #[1] 10.64464

  #----------

  # Using the same data as in the previous example, use egammaAlt
  # to estimate the mean and cv based on the bias-corrected 
  # estimate of shape, and use the cube-root transformation to 
  # normality.

  eqgammaAlt(dat, p = 0.9, method = "bcmle", ci = TRUE, 
    ci.type = "upper", normal.approx.transform = "cube.root")

  #Results of Distribution Parameter Estimation
  #--------------------------------------------
  #
  #Assumed Distribution:            Gamma
  #
  #Estimated Parameter(s):          mean = 4.7932408
  #                                 cv   = 0.7242165
  #
  #Estimation Method:               bcmle of 'shape'
  #
  #Estimated Quantile(s):           90'th %ile = 9.428
  #
  #Quantile Estimation Method:      Quantile(s) Based on
  #                                 bcmle of 'shape'
  #
  #Data:                            dat
  #
  #Sample Size:                     20
  #
  #Confidence Interval for:         90'th %ile
  #
  #Confidence Interval Method:      Exact using
  #                                 Wilson & Hilferty (1931) cube-root
  #                                 transformation to Normality
  #
  #Confidence Interval Type:        upper
  #
  #Confidence Level:                95%
  #
  #Confidence Interval:             LCL =  0.00000
  #                                 UCL = 12.89643

  #----------

  # Clean up
  rm(dat)
  
  #--------------------------------------------------------------------

  # Example 17-3 of USEPA (2009, p. 17-17) shows how to construct a 
  # beta-content upper tolerance limit with 95% coverage and 
  # 95% confidence  using chrysene data and assuming a lognormal 
  # distribution.  Here we will use the same chrysene data but assume a 
  # gamma distribution.

  # A beta-content upper tolerance limit with 95% coverage and 
  # 95% confidence is equivalent to the 95% upper confidence limit for 
  # the 95th percentile.

  attach(EPA.09.Ex.17.3.chrysene.df)
  Chrysene <- Chrysene.ppb[Well.type == "Background"]
  eqgamma(Chrysene, p = 0.95, ci = TRUE, ci.type = "upper")

  #Results of Distribution Parameter Estimation
  #--------------------------------------------
  #
  #Assumed Distribution:            Gamma
  #
  #Estimated Parameter(s):          shape = 2.806929
  #                                 scale = 5.286026
  #
  #Estimation Method:               mle
  #
  #Estimated Quantile(s):           95'th %ile = 31.74348
  #
  #Quantile Estimation Method:      Quantile(s) Based on
  #                                 mle Estimators
  #
  #Data:                            Chrysene
  #
  #Sample Size:                     8
  #
  #Confidence Interval for:         95'th %ile
  #
  #Confidence Interval Method:      Exact using
  #                                 Kulkarni & Powar (2010)
  #                                 transformation to Normality
  #                                 based on mle of 'shape'
  #
  #Confidence Interval Type:        upper
  #
  #Confidence Level:                95%
  #
  #Confidence Interval:             LCL =  0.00000
  #                                 UCL = 69.32425

  #----------
  # Clean up

  rm(Chrysene)
  detach("EPA.09.Ex.17.3.chrysene.df")



