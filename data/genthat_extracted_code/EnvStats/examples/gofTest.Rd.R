library(EnvStats)


### Name: gofTest
### Title: Goodness-of-Fit Test
### Aliases: gofTest gofTest.default gofTest.formula
### Keywords: htest models

### ** Examples

  # Generate 20 observations from a gamma distribution with 
  # parameters shape = 2 and scale = 3 then run various 
  # goodness-of-fit tests.
  # (Note:  the call to set.seed lets you reproduce this example.)

  set.seed(47)
  dat <- rgamma(20, shape = 2, scale = 3)

  # Shapiro-Wilk generalized goodness-of-fit test
  #----------------------------------------------
  gof.list <- gofTest(dat, distribution = "gamma")
  gof.list

  #Results of Goodness-of-Fit Test
  #-------------------------------
  #
  #Test Method:                     Shapiro-Wilk GOF Based on 
  #                                 Chen & Balakrisnan (1995)
  #
  #Hypothesized Distribution:       Gamma
  #
  #Estimated Parameter(s):          shape = 1.909462
  #                                 scale = 4.056819
  #
  #Estimation Method:               mle
  #
  #Data:                            dat
  #
  #Sample Size:                     20
  #
  #Test Statistic:                  W = 0.9834958
  #
  #Test Statistic Parameter:        n = 20
  #
  #P-value:                         0.970903
  #
  #Alternative Hypothesis:          True cdf does not equal the
  #                                 Gamma Distribution.

  dev.new()
  plot(gof.list)

  #----------

  # Redo the example above, but use the bias-corrected mle

  gofTest(dat, distribution = "gamma", 
    est.arg.list = list(method = "bcmle"))

  #Results of Goodness-of-Fit Test
  #-------------------------------
  #
  #Test Method:                     Shapiro-Wilk GOF Based on 
  #                                 Chen & Balakrisnan (1995)
  #
  #Hypothesized Distribution:       Gamma
  #
  #Estimated Parameter(s):          shape = 1.656376
  #                                 scale = 4.676680
  #
  #Estimation Method:               bcmle
  #
  #Data:                            dat
  #
  #Sample Size:                     20
  #
  #Test Statistic:                  W = 0.9834346
  #
  #Test Statistic Parameter:        n = 20
  #
  #P-value:                         0.9704046
  #
  #Alternative Hypothesis:          True cdf does not equal the
  #                                 Gamma Distribution.

  #----------
  
  # Komogorov-Smirnov goodness-of-fit test (pre-specified parameters)
  #------------------------------------------------------------------

  gofTest(dat, test = "ks", distribution = "gamma", 
    param.list = list(shape = 2, scale = 3))

  #Results of Goodness-of-Fit Test
  #-------------------------------
  #
  #Test Method:                     Kolmogorov-Smirnov GOF
  #
  #Hypothesized Distribution:       Gamma(shape = 2, scale = 3)
  #
  #Data:                            dat
  #
  #Sample Size:                     20
  #
  #Test Statistic:                  ks = 0.2313878
  #
  #Test Statistic Parameter:        n = 20
  #
  #P-value:                         0.2005083
  #
  #Alternative Hypothesis:          True cdf does not equal the
  #                                 Gamma(shape = 2, scale = 3)
  #                                 Distribution.

  #----------

  # ProUCL Version of Komogorov-Smirnov goodness-of-fit test 
  # for a Gamma Distribution (estimated parameters)
  #---------------------------------------------------------

  gofTest(dat, test = "proucl.ks.gamma", distribution = "gamma")

  #Results of Goodness-of-Fit Test
  #-------------------------------
  #
  #Test Method:                     ProUCL Kolmogorov-Smirnov Gamma GOF
  #
  #Hypothesized Distribution:       Gamma
  #
  #Estimated Parameter(s):          shape = 1.909462
  #                                 scale = 4.056819
  #
  #Estimation Method:               MLE
  #
  #Data:                            dat
  #
  #Sample Size:                     20
  #
  #Test Statistic:                  D = 0.0988692
  #
  #Test Statistic Parameter:        n = 20
  #
  #Critical Values:                 D.0.01 = 0.228
  #                                 D.0.05 = 0.196
  #                                 D.0.10 = 0.180
  #
  #P-value:                         >= 0.10
  #
  #Alternative Hypothesis:          True cdf does not equal the
  #                                 Gamma Distribution.

  #----------

  # Chi-squared goodness-of-fit test (estimated parameters)
  #--------------------------------------------------------

  gofTest(dat, test = "chisq", distribution = "gamma", n.classes = 4)

  #Results of Goodness-of-Fit Test
  #-------------------------------
  #
  #Test Method:                     Chi-square GOF
  #
  #Hypothesized Distribution:       Gamma
  #
  #Estimated Parameter(s):          shape = 1.909462
  #                                 scale = 4.056819
  #
  #Estimation Method:               mle
  #
  #Data:                            dat
  #
  #Sample Size:                     20
  #
  #Test Statistic:                  Chi-square = 1.2
  #
  #Test Statistic Parameter:        df = 1
  #
  #P-value:                         0.2733217
  #
  #Alternative Hypothesis:          True cdf does not equal the
  #                                 Gamma Distribution.

  #----------
  # Clean up

  rm(dat, gof.list)
  graphics.off()

  #--------------------------------------------------------------------

  # Example 10-2 of USEPA (2009, page 10-14) gives an example of 
  # using the Shapiro-Wilk test to test the assumption of normality 
  # for nickel concentrations (ppb) in groundwater collected over 
  # 4 years.  The data for this example are stored in 
  # EPA.09.Ex.10.1.nickel.df.

  EPA.09.Ex.10.1.nickel.df
  #   Month   Well Nickel.ppb
  #1      1 Well.1       58.8
  #2      3 Well.1        1.0
  #3      6 Well.1      262.0
  #4      8 Well.1       56.0
  #5     10 Well.1        8.7
  #6      1 Well.2       19.0
  #7      3 Well.2       81.5
  #8      6 Well.2      331.0
  #9      8 Well.2       14.0
  #10    10 Well.2       64.4
  #11     1 Well.3       39.0
  #12     3 Well.3      151.0
  #13     6 Well.3       27.0
  #14     8 Well.3       21.4
  #15    10 Well.3      578.0
  #16     1 Well.4        3.1
  #17     3 Well.4      942.0
  #18     6 Well.4       85.6
  #19     8 Well.4       10.0
  #20    10 Well.4      637.0

  # Test for a normal distribution:
  #--------------------------------

  gof.list <- gofTest(Nickel.ppb ~ 1, data = EPA.09.Ex.10.1.nickel.df)
  gof.list

  #Results of Goodness-of-Fit Test
  #-------------------------------
  #
  #Test Method:                     Shapiro-Wilk GOF
  #
  #Hypothesized Distribution:       Normal
  #
  #Estimated Parameter(s):          mean = 169.5250
  #                                 sd   = 259.7175
  #
  #Estimation Method:               mvue
  #
  #Data:                            Nickel.ppb
  #
  #Data Source:                     EPA.09.Ex.10.1.nickel.df
  #
  #Sample Size:                     20
  #
  #Test Statistic:                  W = 0.6788888
  #
  #Test Statistic Parameter:        n = 20
  #
  #P-value:                         2.17927e-05
  #
  #Alternative Hypothesis:          True cdf does not equal the
  #                                 Normal Distribution.

  dev.new()
  plot(gof.list)

  #----------

  # Test for a lognormal distribution:
  #-----------------------------------

  gofTest(Nickel.ppb ~ 1, data = EPA.09.Ex.10.1.nickel.df, 
    dist = "lnorm")

  #Results of Goodness-of-Fit Test
  #-------------------------------
  #
  #Test Method:                     Shapiro-Wilk GOF
  #
  #Hypothesized Distribution:       Lognormal
  #
  #Estimated Parameter(s):          meanlog = 3.918529
  #                                 sdlog   = 1.801404
  #
  #Estimation Method:               mvue
  #
  #Data:                            Nickel.ppb
  #
  #Data Source:                     EPA.09.Ex.10.1.nickel.df
  #
  #Sample Size:                     20
  #
  #Test Statistic:                  W = 0.978946
  #
  #Test Statistic Parameter:        n = 20
  #
  #P-value:                         0.9197735
  #
  #Alternative Hypothesis:          True cdf does not equal the
  #                                 Lognormal Distribution.

  #----------

  # Test for a lognormal distribution, but use the 
  # Mean and CV parameterization:
  #-----------------------------------------------

  gofTest(Nickel.ppb ~ 1, data = EPA.09.Ex.10.1.nickel.df, 
    dist = "lnormAlt")

  #Results of Goodness-of-Fit Test
  #-------------------------------
  #
  #Test Method:                     Shapiro-Wilk GOF
  #
  #Hypothesized Distribution:       Lognormal
  #
  #Estimated Parameter(s):          mean = 213.415628
  #                                 cv   =   2.809377
  #
  #Estimation Method:               mvue
  #
  #Data:                            Nickel.ppb
  #
  #Data Source:                     EPA.09.Ex.10.1.nickel.df
  #
  #Sample Size:                     20
  #
  #Test Statistic:                  W = 0.978946
  #
  #Test Statistic Parameter:        n = 20
  #
  #P-value:                         0.9197735
  #
  #Alternative Hypothesis:          True cdf does not equal the
  #                                 Lognormal Distribution.

  #----------
  # Clean up

  rm(gof.list)
  graphics.off()

  #---------------------------------------------------------------------------

  # Generate 20 observations from a normal distribution with mean=3 and sd=2, and 
  # generate 10 observaions from a normal distribution with mean=2 and sd=2 then 
  # test whether these sets of observations come from the same distribution.
  # (Note: the call to set.seed simply allows you to reproduce this example.)

  set.seed(300) 
  dat1 <- rnorm(20, mean = 3, sd = 2) 
  dat2 <- rnorm(10, mean = 1, sd = 2) 
  gofTest(x = dat1, y = dat2, test = "ks")

  #Results of Goodness-of-Fit Test
  #-------------------------------
  #
  #Test Method:                     2-Sample K-S GOF
  #
  #Hypothesized Distribution:       Equal
  #
  #Data:                            x = dat1
  #                                 y = dat2
  #
  #Sample Sizes:                    n.x = 20
  #                                 n.y = 10
  #
  #Test Statistic:                  ks = 0.7
  #
  #Test Statistic Parameters:       n = 20
  #                                 m = 10
  #
  #P-value:                         0.001669561
  #
  #Alternative Hypothesis:          The cdf of 'dat1' does not equal
  #                                 the cdf of 'dat2'.

  #----------
  # Clean up

  rm(dat1, dat2)



