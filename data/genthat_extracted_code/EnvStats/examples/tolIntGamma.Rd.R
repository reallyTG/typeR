library(EnvStats)


### Name: tolIntGamma
### Title: Tolerance Interval for a Gamma Distribution
### Aliases: tolIntGamma tolIntGammaAlt
### Keywords: distribution htest

### ** Examples

  # Generate 20 observations from a gamma distribution with parameters 
  # shape=3 and scale=2, then create a tolerance interval. 
  # (Note: the call to set.seed simply allows you to reproduce this 
  # example.)

  set.seed(250) 
  dat <- rgamma(20, shape = 3, scale = 2) 
  tolIntGamma(dat)

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
  #Data:                            dat
  #
  #Sample Size:                     20
  #
  #Tolerance Interval Coverage:     95%
  #
  #Coverage Type:                   content
  #
  #Tolerance Interval Method:       Exact using
  #                                 Kulkarni & Powar (2010)
  #                                 transformation to Normality
  #                                 based on mle of 'shape'
  #
  #Tolerance Interval Type:         two-sided
  #
  #Confidence Level:                95%
  #
  #Number of Future Observations:   1
  #
  #Tolerance Interval:              LTL =  0.2340438
  #                                 UTL = 21.2996464

  #--------------------------------------------------------------------

  # Using the same data as in the previous example, create an upper 
  # one-sided tolerance interval and use the bias-corrected estimate of 
  # shape.

  tolIntGamma(dat, ti.type = "upper", est.method = "bcmle")

  #Results of Distribution Parameter Estimation
  #--------------------------------------------
  #
  #Assumed Distribution:            Gamma
  #
  #Estimated Parameter(s):          shape = 1.906616
  #                                 scale = 2.514005
  #
  #Estimation Method:               bcmle
  #
  #Data:                            dat
  #
  #Sample Size:                     20
  #
  #Tolerance Interval Coverage:     95%
  #
  #Coverage Type:                   content
  #
  #Tolerance Interval Method:       Exact using
  #                                 Kulkarni & Powar (2010)
  #                                 transformation to Normality
  #                                 based on bcmle of 'shape'
  #
  #Tolerance Interval Type:         upper
  #
  #Confidence Level:                95%
  #
  #Tolerance Interval:              LTL =  0.00000
  #                                 UTL = 17.72107

  #----------

  # Clean up
  rm(dat)
  
  #--------------------------------------------------------------------

  # Example 17-3 of USEPA (2009, p. 17-17) shows how to construct a 
  # beta-content upper tolerance limit with 95% coverage and 95% 
  # confidence  using chrysene data and assuming a lognormal 
  # distribution.  Here we will use the same chrysene data but assume a 
  # gamma distribution.

  attach(EPA.09.Ex.17.3.chrysene.df)
  Chrysene <- Chrysene.ppb[Well.type == "Background"]

  #----------
  # First perform a goodness-of-fit test for a gamma distribution

  gofTest(Chrysene, dist = "gamma")

  #Results of Goodness-of-Fit Test
  #-------------------------------
  #
  #Test Method:                     Shapiro-Wilk GOF Based on 
  #                                 Chen & Balakrisnan (1995)
  #
  #Hypothesized Distribution:       Gamma
  #
  #Estimated Parameter(s):          shape = 2.806929
  #                                 scale = 5.286026
  #
  #Estimation Method:               mle
  #
  #Data:                            Chrysene
  #
  #Sample Size:                     8
  #
  #Test Statistic:                  W = 0.9156306
  #
  #Test Statistic Parameter:        n = 8
  #
  #P-value:                         0.3954223
  #
  #Alternative Hypothesis:          True cdf does not equal the
  #                                 Gamma Distribution.

  #----------
  # Now compute the upper tolerance limit

  tolIntGamma(Chrysene, ti.type = "upper", coverage = 0.95, 
    conf.level = 0.95)

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
  #Data:                            Chrysene
  #
  #Sample Size:                     8
  #
  #Tolerance Interval Coverage:     95%
  #
  #Coverage Type:                   content
  #
  #Tolerance Interval Method:       Exact using
  #                                 Kulkarni & Powar (2010)
  #                                 transformation to Normality
  #                                 based on mle of 'shape'
  #
  #Tolerance Interval Type:         upper
  #
  #Confidence Level:                95%
  #
  #Tolerance Interval:              LTL =  0.00000
  #                                 UTL = 69.32425

  #----------
  # Compare this upper tolerance limit of 69 ppb to the upper tolerance limit 
  # assuming a lognormal distribution.

  tolIntLnorm(Chrysene, ti.type = "upper", coverage = 0.95, 
    conf.level = 0.95)$interval$limits["UTL"]

  #    UTL 
  #90.9247

  #----------
  # Clean up

  rm(Chrysene)
  detach("EPA.09.Ex.17.3.chrysene.df")

  #--------------------------------------------------------------------

  # Reproduce some of the example on page 73 of 
  # Krishnamoorthy et al. (2008), which uses alkalinity concentrations 
  # reported in Gibbons (1994) and Gibbons et al. (2009) to construct 
  # two-sided and one-sided upper tolerance limits for various values 
  # of coverage using a 95% confidence level.

  tolIntGamma(Gibbons.et.al.09.Alkilinity.vec, ti.type = "upper", 
    coverage = 0.9, normal.approx.transform = "cube.root")

  #Results of Distribution Parameter Estimation
  #--------------------------------------------
  #
  #Assumed Distribution:            Gamma
  #
  #Estimated Parameter(s):          shape = 9.375013
  #                                 scale = 6.202461
  #
  #Estimation Method:               mle
  #
  #Data:                            Gibbons.et.al.09.Alkilinity.vec
  #
  #Sample Size:                     27
  #
  #Tolerance Interval Coverage:     90%
  #
  #Coverage Type:                   content
  #
  #Tolerance Interval Method:       Exact using
  #                                 Wilson & Hilferty (1931) cube-root
  #                                 transformation to Normality
  #
  #Tolerance Interval Type:         upper
  #
  #Confidence Level:                95%
  #
  #Tolerance Interval:              LTL =  0.00000
  #                                 UTL = 97.70502

  tolIntGamma(Gibbons.et.al.09.Alkilinity.vec,  
    coverage = 0.99, normal.approx.transform = "cube.root")

  #Results of Distribution Parameter Estimation
  #--------------------------------------------
  #
  #Assumed Distribution:            Gamma
  #
  #Estimated Parameter(s):          shape = 9.375013
  #                                 scale = 6.202461
  #
  #Estimation Method:               mle
  #
  #Data:                            Gibbons.et.al.09.Alkilinity.vec
  #
  #Sample Size:                     27
  #
  #Tolerance Interval Coverage:     99%
  #
  #Coverage Type:                   content
  #
  #Tolerance Interval Method:       Exact using
  #                                 Wilson & Hilferty (1931) cube-root
  #                                 transformation to Normality
  #
  #Tolerance Interval Type:         two-sided
  #
  #Confidence Level:                95%
  #
  #Tolerance Interval:              LTL =  13.14318
  #                                 UTL = 148.43876



