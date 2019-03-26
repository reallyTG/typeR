library(EnvStats)


### Name: predIntNorm
### Title: Prediction Interval for a Normal Distribution
### Aliases: predIntNorm
### Keywords: distribution htest

### ** Examples

  # Generate 20 observations from a normal distribution with parameters 
  # mean=10 and sd=2, then create a two-sided 95% prediction interval for 
  # the next observation. 
  # (Note: the call to set.seed simply allows you to reproduce this example.)

  set.seed(47) 
  dat <- rnorm(20, mean = 10, sd = 2) 
  predIntNorm(dat)

  #Results of Distribution Parameter Estimation
  #--------------------------------------------
  #
  #Assumed Distribution:            Normal
  #
  #Estimated Parameter(s):          mean = 9.792856
  #                                 sd   = 1.821286
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
  #Confidence Level:                95%
  #
  #Number of Future Observations:   1
  #
  #Prediction Interval:             LPL =  5.886723
  #                                 UPL = 13.698988

  #----------

  # Using the same data from the last example, create a one-sided 
  # upper 99% prediction limit for the next 3 averages of order 2 
  # (i.e., each of the 3 future averages is based on a sample size 
  # of 2 future observations).

  predIntNorm(dat, n.mean = 2, k = 3, conf.level = 0.99, 
    pi.type = "upper")

  #Results of Distribution Parameter Estimation
  #--------------------------------------------
  #
  #Assumed Distribution:            Normal
  #
  #Estimated Parameter(s):          mean = 9.792856
  #                                 sd   = 1.821286
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
  #Number of Future Averages:       3
  #
  #Sample Size for Averages:        2
  #
  #Prediction Interval:             LPL =     -Inf
  #                                 UPL = 13.90537

  #----------

  # Compare the result above that is based on the Bonferroni method 
  # with the exact method

  predIntNorm(dat, n.mean = 2, k = 3, conf.level = 0.99, 
    pi.type = "upper", method = "exact")$interval$limits["UPL"]

  #     UPL 
  #13.89272

  #----------

  # Clean up
  rm(dat)
  
  #--------------------------------------------------------------------

  # Example 18-1 of USEPA (2009, p.18-9) shows how to construct a 95% 
  # prediction interval for 4 future observations assuming a 
  # normal distribution based on arsenic concentrations (ppb) in 
  # groundwater at a solid waste landfill.  There were 4 years of 
  # quarterly monitoring, and years 1-3 are considered background.  
  # The question to be answered is whether there is evidence of 
  # contamination in year 4.  

  # The data for this example is stored in EPA.09.Ex.18.1.arsenic.df.

  EPA.09.Ex.18.1.arsenic.df

  #   Year Sampling.Period Arsenic.ppb
  #1     1      Background        12.6
  #2     1      Background        30.8
  #3     1      Background        52.0
  #4     1      Background        28.1
  #5     2      Background        33.3
  #6     2      Background        44.0
  #7     2      Background         3.0
  #8     2      Background        12.8
  #9     3      Background        58.1
  #10    3      Background        12.6
  #11    3      Background        17.6
  #12    3      Background        25.3
  #13    4      Compliance        48.0
  #14    4      Compliance        30.3
  #15    4      Compliance        42.5
  #16    4      Compliance        15.0 

  As.bkgd <- with(EPA.09.Ex.18.1.arsenic.df, 
    Arsenic.ppb[Sampling.Period == "Background"])
  As.cmpl <- with(EPA.09.Ex.18.1.arsenic.df, 
    Arsenic.ppb[Sampling.Period == "Compliance"])

  # A Shapiro-Wilks goodness-of-fit test for normality indicates  
  # there is no evidence to reject the assumption of normality
  # for the background data:

  gofTest(As.bkgd)

  #Results of Goodness-of-Fit Test
  #-------------------------------
  #
  #Test Method:                     Shapiro-Wilk GOF
  #
  #Hypothesized Distribution:       Normal
  #
  #Estimated Parameter(s):          mean = 27.51667
  #                                 sd   = 17.10119
  #
  #Estimation Method:               mvue
  #
  #Data:                            As.bkgd
  #
  #Sample Size:                     12
  #
  #Test Statistic:                  W = 0.94695
  #
  #Test Statistic Parameter:        n = 12
  #
  #P-value:                         0.5929102
  #
  #Alternative Hypothesis:          True cdf does not equal the
  #                                 Normal Distribution.

  # Here is the one-sided 95% upper prediction limit:

  UPL <- predIntNorm(As.bkgd, k = 4, 
    pi.type = "upper")$interval$limits["UPL"]
  UPL
  #     UPL 
  #73.67237  

  # Are any of the compliance observations above the prediction limit?

  any(As.cmpl > UPL)
  #[1] FALSE

  #==========

  # Cleanup
  #--------

  rm(As.bkgd, As.cmpl, UPL)



