library(EnvStats)


### Name: egamma
### Title: Estimate Parameters of Gamma Distribution
### Aliases: egamma egammaAlt
### Keywords: distribution htest

### ** Examples

  # Generate 20 observations from a gamma distribution with parameters 
  # shape=3 and scale=2, then estimate the parameters. 
  # (Note: the call to set.seed simply allows you to reproduce this 
  # example.)

  set.seed(250) 
  dat <- rgamma(20, shape = 3, scale = 2) 
  egamma(dat, ci = TRUE)

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
  #Confidence Interval for:         mean
  #
  #Confidence Interval Method:      Optimum Power Normal Approximation
  #                                 of Kulkarni & Powar (2010)
  #                                 using mle of 'shape'
  #
  #Normal Transform Power:          0.246
  #
  #Confidence Interval Type:        two-sided
  #
  #Confidence Level:                95%
  #
  #Confidence Interval:             LCL = 3.361652
  #                                 UCL = 6.746794

  # Clean up
  rm(dat)

  #====================================================================

  # Using the reference area TcCB data in EPA.94b.tccb.df, assume a 
  # gamma distribution, estimate the parameters based on the 
  # bias-corrected mle of shape, and compute a one-sided upper 90% 
  # confidence interval for the mean.

  #----------
  # First test to see whether the data appear to follow a gamma 
  # distribution.

  with(EPA.94b.tccb.df, 
    gofTest(TcCB[Area == "Reference"], dist = "gamma", 
      est.arg.list = list(method = "bcmle"))
  )

  #Results of Goodness-of-Fit Test
  #-------------------------------
  #
  #Test Method:                     Shapiro-Wilk GOF Based on 
  #                                 Chen & Balakrisnan (1995)
  #
  #Hypothesized Distribution:       Gamma
  #
  #Estimated Parameter(s):          shape = 4.5695247
  #                                 scale = 0.1309788
  #
  #Estimation Method:               bcmle
  #
  #Data:                            TcCB[Area == "Reference"]
  #
  #Sample Size:                     47
  #
  #Test Statistic:                  W = 0.9703827
  #
  #Test Statistic Parameter:        n = 47
  #
  #P-value:                         0.2739512
  #
  #Alternative Hypothesis:          True cdf does not equal the
  #                                 Gamma Distribution.

  #----------
  # Now estimate the paramters and compute the upper confidence limit.

  with(EPA.94b.tccb.df, 
    egamma(TcCB[Area == "Reference"], method = "bcmle", ci = TRUE, 
      ci.type = "upper", conf.level = 0.9) 
  )

  #Results of Distribution Parameter Estimation
  #--------------------------------------------
  #
  #Assumed Distribution:            Gamma
  #
  #Estimated Parameter(s):          shape = 4.5695247
  #                                 scale = 0.1309788
  #
  #Estimation Method:               bcmle
  #
  #Data:                            TcCB[Area == "Reference"]
  #
  #Sample Size:                     47
  #
  #Confidence Interval for:         mean
  #
  #Confidence Interval Method:      Optimum Power Normal Approximation
  #                                 of Kulkarni & Powar (2010)
  #                                 using bcmle of 'shape'
  #
  #Normal Transform Power:          0.246
  #
  #Confidence Interval Type:        upper
  #
  #Confidence Level:                90%
  #
  #Confidence Interval:             LCL = 0.0000000
  #                                 UCL = 0.6561838

  #------------------------------------------------------------------

  # Repeat the above example but use the alternative parameterization.

  with(EPA.94b.tccb.df, 
    egammaAlt(TcCB[Area == "Reference"], method = "bcmle", ci = TRUE, 
      ci.type = "upper", conf.level = 0.9) 
  )

  #Results of Distribution Parameter Estimation
  #--------------------------------------------
  #
  #Assumed Distribution:            Gamma
  #
  #Estimated Parameter(s):          mean = 0.5985106
  #                                 cv   = 0.4678046
  #
  #Estimation Method:               bcmle of 'shape'
  #
  #Data:                            TcCB[Area == "Reference"]
  #
  #Sample Size:                     47
  #
  #Confidence Interval for:         mean
  #
  #Confidence Interval Method:      Optimum Power Normal Approximation
  #                                 of Kulkarni & Powar (2010)
  #                                 using bcmle of 'shape'
  #
  #Normal Transform Power:          0.246
  #
  #Confidence Interval Type:        upper
  #
  #Confidence Level:                90%
  #
  #Confidence Interval:             LCL = 0.0000000
  #                                 UCL = 0.6561838

  #------------------------------------------------------------------

  # Compare the upper confidence limit based on 
  # 1) the default method: 
  #    normal approximation method based on Kulkarni and Powar (2010)
  # 2) Profile Likelihood 
  # 3) Chi-Square Approximation
  # 4) Chi-Square Adjusted

  # Default Method 
  #---------------
  with(EPA.94b.tccb.df, 
    egamma(TcCB[Area == "Reference"], method = "bcmle", ci = TRUE, 
      ci.type = "upper", conf.level = 0.9)$interval$limits["UCL"]
  )

  #      UCL 
  #0.6561838

  # Profile Likelihood 
  #-------------------
  with(EPA.94b.tccb.df, 
    egamma(TcCB[Area == "Reference"], method = "mle", ci = TRUE, 
      ci.type = "upper", conf.level = 0.9,
      ci.method = "profile.likelihood")$interval$limits["UCL"]
  )

  #      UCL 
  #0.6527009


  # Chi-Square Approximation
  #-------------------------
  with(EPA.94b.tccb.df, 
    egamma(TcCB[Area == "Reference"], method = "mle", ci = TRUE, 
      ci.type = "upper", conf.level = 0.9, 
      ci.method = "chisq.approx")$interval$limits["UCL"]
  )

  #      UCL 
  #0.6532188


  # Chi-Square Adjusted
  #--------------------
  with(EPA.94b.tccb.df, 
    egamma(TcCB[Area == "Reference"], method = "mle", ci = TRUE, 
      ci.type = "upper", conf.level = 0.9, 
      ci.method = "chisq.adj")$interval$limits["UCL"]
  )

  #    UCL 
  #0.65467




