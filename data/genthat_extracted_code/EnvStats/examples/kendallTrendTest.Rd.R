library(EnvStats)


### Name: kendallTrendTest
### Title: Kendall's Nonparametric Test for Montonic Trend
### Aliases: kendallTrendTest kendallTrendTest.formula
###   kendallTrendTest.default
### Keywords: htest nonparametric regression

### ** Examples

  # Reproduce Example 17-6 on page 17-33 of USEPA (2009).  This example 
  # tests for trend in sulfate concentrations (ppm) collected at various 
  # months between 1989 and 1996. 

  head(EPA.09.Ex.17.6.sulfate.df)
  #  Sample.No Year Month Sampling.Date       Date Sulfate.ppm
  #1         1   89     6          89.6 1989-06-01         480
  #2         2   89     8          89.8 1989-08-01         450
  #3         3   90     1          90.1 1990-01-01         490
  #4         4   90     3          90.3 1990-03-01         520
  #5         5   90     6          90.6 1990-06-01         485
  #6         6   90     8          90.8 1990-08-01         510


  # Plot the data
  #--------------
  dev.new()
  with(EPA.09.Ex.17.6.sulfate.df, 
    plot(Sampling.Date, Sulfate.ppm, pch = 15, ylim = c(400, 900),
    xlab = "Sampling Date", ylab = "Sulfate Conc (ppm)",
    main = "Figure 17-6. Time Series Plot of \nSulfate Concentrations (ppm)")
  )
  Sulfate.fit <- lm(Sulfate.ppm ~ Sampling.Date, 
    data = EPA.09.Ex.17.6.sulfate.df)
  abline(Sulfate.fit, lty = 2)


  # Perform the Kendall test for trend
  #-----------------------------------
  kendallTrendTest(Sulfate.ppm ~ Sampling.Date, 
    data = EPA.09.Ex.17.6.sulfate.df)

  #Results of Hypothesis Test
  #--------------------------
  #
  #Null Hypothesis:                 tau = 0
  #
  #Alternative Hypothesis:          True tau is not equal to 0
  #
  #Test Name:                       Kendall's Test for Trend
  #                                 (with continuity correction)
  #
  #Estimated Parameter(s):          tau       =     0.7667984
  #                                 slope     =    26.6666667
  #                                 intercept = -1909.3333333
  #
  #Estimation Method:               slope:      Theil/Sen Estimator
  #                                 intercept:  Conover's Estimator
  #
  #Data:                            y = Sulfate.ppm  
  #                                 x = Sampling.Date
  #
  #Data Source:                     EPA.09.Ex.17.6.sulfate.df
  #
  #Sample Size:                     23
  #
  #Test Statistic:                  z = 5.107322
  #
  #P-value:                         3.267574e-07
  #
  #Confidence Interval for:         slope
  #
  #Confidence Interval Method:      Gilbert's Modification
  #                                 of Theil/Sen Method
  #
  #Confidence Interval Type:        two-sided
  #
  #Confidence Level:                95%
  #
  #Confidence Interval:             LCL = 20.00000
  #                                 UCL = 35.71182


  # Clean up
  #---------
  rm(Sulfate.fit)
  graphics.off()



