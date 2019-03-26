library(EnvStats)


### Name: predIntLnorm
### Title: Prediction Interval for a Lognormal Distribution
### Aliases: predIntLnorm predIntLnormAlt
### Keywords: distribution htest

### ** Examples

  # Generate 20 observations from a lognormal distribution with parameters 
  # meanlog=0 and sdlog=1.  The exact two-sided 90% prediction interval for 
  # k=1 future observation is given by: [exp(-1.645), exp(1.645)] = [0.1930, 5.181]. 
  # Use predIntLnorm to estimate the distribution parameters, and construct a 
  # two-sided 90% prediction interval.
  # (Note: the call to set.seed simply allows you to reproduce this example.)

  set.seed(47) 
  dat <- rlnorm(20, meanlog = 0, sdlog = 1) 
  predIntLnorm(dat, conf = 0.9)

  #Results of Distribution Parameter Estimation
  #--------------------------------------------
  #
  #Assumed Distribution:            Lognormal
  #
  #Estimated Parameter(s):          meanlog = -0.1035722
  #                                 sdlog   =  0.9106429
  #
  #Estimation Method:               mvue
  #
  #Data:                            dat
  #
  #Sample Size:                     20
  #
  #Prediction Interval Method:      exact
  #
  #Prediction Interval Type:        two-sided
  #
  #Confidence Level:                90%
  #
  #Number of Future Observations:   1
  #
  #Prediction Interval:             LPL = 0.1795898
  #                                 UPL = 4.5264399

  #----------

  # Repeat the above example, but do it in two steps.  
  # First create a list called est.list containing information about the 
  # estimated parameters, then create the prediction interval.

  est.list <- elnorm(dat) 

  est.list 
  #Results of Distribution Parameter Estimation
  #--------------------------------------------
  #
  #Assumed Distribution:            Lognormal
  #
  #Estimated Parameter(s):          meanlog = -0.1035722
  #                                 sdlog   =  0.9106429
  #
  #Estimation Method:               mvue
  #
  #Data:                            dat
  #
  #Sample Size:                     20

  predIntLnorm(est.list, conf = 0.9)
  #Results of Distribution Parameter Estimation
  #--------------------------------------------
  #
  #Assumed Distribution:            Lognormal
  #
  #Estimated Parameter(s):          meanlog = -0.1035722
  #                                 sdlog   =  0.9106429
  #
  #Estimation Method:               mvue
  #
  #Data:                            dat
  #
  #Sample Size:                     20
  #
  #Prediction Interval Method:      exact
  #
  #Prediction Interval Type:        two-sided
  #
  #Confidence Level:                90%
  #
  #Number of Future Observations:   1
  #
  #Prediction Interval:             LPL = 0.1795898
  #                                 UPL = 4.5264399

  #----------

  # Using the same data from the first example, create a one-sided 
  # upper 99% prediction limit for the next 3 geometric means of order 2 
  # (i.e., each of the 3 future geometric means is based on a sample size 
  # of 2 future observations).

  predIntLnorm(dat, n.geomean = 2, k = 3, conf.level = 0.99, 
    pi.type = "upper")

  #Results of Distribution Parameter Estimation
  #--------------------------------------------
  #
  #Assumed Distribution:            Lognormal
  #
  #Estimated Parameter(s):          meanlog = -0.1035722
  #                                 sdlog   =  0.9106429
  #
  #Estimation Method:               mvue
  #
  #Data:                            dat
  #
  #Sample Size:                     20
  #
  #Prediction Interval Method:      Bonferroni
  #
  #Prediction Interval Type:        upper
  #
  #Confidence Level:                99%
  #
  #Number of Future
  #Geometric Means:                 3
  #
  #Sample Size for
  #Geometric Means:                 2
  #
  #Prediction Interval:             LPL = 0.000000
  #                                 UPL = 7.047571

  #----------

  # Compare the result above that is based on the Bonferroni method 
  # with the exact method

  predIntLnorm(dat, n.geomean = 2, k = 3, conf.level = 0.99, 
    pi.type = "upper", method = "exact")$interval$limits["UPL"]

  #    UPL 
  #7.00316

  #----------

  # Clean up
  rm(dat, est.list)
  
  #--------------------------------------------------------------------

  # Example 18-2 of USEPA (2009, p.18-15) shows how to construct a 99% 
  # upper prediction interval for the log-scale mean of 4 future observations 
  # (future mean of order 4) assuming a lognormal distribution based on 
  # chrysene concentrations (ppb) in groundwater at 2 background wells.  
  # Data were collected once per month over 4 months at the 2 background 
  # wells, and also at a compliance well.  
  # The question to be answered is whether there is evidence of 
  # contamination at the compliance well.

  # Here we will follow the example, but look at the geometric mean 
  # instead of the log-scale mean.

  #----------

  # The data for this example are stored in EPA.09.Ex.18.2.chrysene.df.

  EPA.09.Ex.18.2.chrysene.df

  #   Month   Well  Well.type Chrysene.ppb
  #1      1 Well.1 Background          6.9
  #2      2 Well.1 Background         27.3
  #3      3 Well.1 Background         10.8
  #4      4 Well.1 Background          8.9
  #5      1 Well.2 Background         15.1
  #6      2 Well.2 Background          7.2
  #7      3 Well.2 Background         48.4
  #8      4 Well.2 Background          7.8
  #9      1 Well.3 Compliance         68.0
  #10     2 Well.3 Compliance         48.9
  #11     3 Well.3 Compliance         30.1
  #12     4 Well.3 Compliance         38.1 

  Chrysene.bkgd <- with(EPA.09.Ex.18.2.chrysene.df, 
    Chrysene.ppb[Well.type == "Background"])
  Chrysene.cmpl <- with(EPA.09.Ex.18.2.chrysene.df, 
    Chrysene.ppb[Well.type == "Compliance"])


  #----------

  # A Shapiro-Wilks goodness-of-fit test for normality indicates  
  # we should reject the assumption of normality and assume a 
  # lognormal distribution for the background well data:

  gofTest(Chrysene.bkgd)

  #Results of Goodness-of-Fit Test
  #-------------------------------
  #
  #Test Method:                     Shapiro-Wilk GOF
  #
  #Hypothesized Distribution:       Normal
  #
  #Estimated Parameter(s):          mean = 16.55000
  #                                 sd   = 14.54441
  #
  #Estimation Method:               mvue
  #
  #Data:                            Chrysene.bkgd
  #
  #Sample Size:                     8
  #
  #Test Statistic:                  W = 0.7289006
  #
  #Test Statistic Parameter:        n = 8
  #
  #P-value:                         0.004759859
  #
  #Alternative Hypothesis:          True cdf does not equal the
  #                                 Normal Distribution.

  gofTest(Chrysene.bkgd, dist = "lnorm")

  #Results of Goodness-of-Fit Test
  #-------------------------------
  #
  #Test Method:                     Shapiro-Wilk GOF
  #
  #Hypothesized Distribution:       Lognormal
  #
  #Estimated Parameter(s):          meanlog = 2.5533006
  #                                 sdlog   = 0.7060038
  #
  #Estimation Method:               mvue
  #
  #Data:                            Chrysene.bkgd
  #
  #Sample Size:                     8
  #
  #Test Statistic:                  W = 0.8546352
  #
  #Test Statistic Parameter:        n = 8
  #
  #P-value:                         0.1061057
  #
  #Alternative Hypothesis:          True cdf does not equal the
  #                                 Lognormal Distribution.

  #----------

  # Here is the one-sided 99% upper prediction limit for 
  # a geometric mean based on 4 future observations:

  predIntLnorm(Chrysene.bkgd, n.geomean = 4, k = 1, 
    conf.level = 0.99, pi.type = "upper")

  #Results of Distribution Parameter Estimation
  #--------------------------------------------
  #
  #Assumed Distribution:            Lognormal
  #
  #Estimated Parameter(s):          meanlog = 2.5533006
  #                                 sdlog   = 0.7060038
  #
  #Estimation Method:               mvue
  #
  #Data:                            Chrysene.bkgd
  #
  #Sample Size:                     8
  #
  #Prediction Interval Method:      exact
  #
  #Prediction Interval Type:        upper
  #
  #Confidence Level:                99%
  #
  #Number of Future
  #Geometric Means:                 1
  #
  #Sample Size for
  #Geometric Means:                 4
  #
  #Prediction Interval:             LPL =  0.00000
  #                                 UPL = 46.96613

  UPL <- predIntLnorm(Chrysene.bkgd, n.geomean = 4, k = 1, 
    conf.level = 0.99, pi.type = "upper")$interval$limits["UPL"]

  UPL
  #     UPL 
  #46.96613
  
  # Is there evidence of contamination at the compliance well?

  geoMean(Chrysene.cmpl)
  #[1] 44.19034

  # Since the geometric mean at the compliance well is less than 
  # the upper prediction limit, there is no evidence of contamination.

  #----------

  # Cleanup
  #--------

  rm(Chrysene.bkgd, Chrysene.cmpl, UPL)



