library(EnvStats)


### Name: kendallSeasonalTrendTest
### Title: Nonparametric Test for Monotonic Trend Within Each Season Based
###   on Kendall's Tau Statistic
### Aliases: kendallSeasonalTrendTest kendallSeasonalTrendTest.default
###   kendallSeasonalTrendTest.formula kendallSeasonalTrendTest.data.frame
###   kendallSeasonalTrendTest.matrix
### Keywords: htest nonparametric regression

### ** Examples

  # Reproduce Example 14-10 on page 14-38 of USEPA (2009).  This example 
  # tests for trend in analyte concentrations (ppm) collected monthly  
  # between 1983 and 1985. 

  head(EPA.09.Ex.14.8.df)
  #     Month Year Unadj.Conc Adj.Conc
  #1  January 1983       1.99     2.11
  #2 February 1983       2.10     2.14
  #3    March 1983       2.12     2.10
  #4    April 1983       2.12     2.13
  #5      May 1983       2.11     2.12
  #6     June 1983       2.15     2.12

  tail(EPA.09.Ex.14.8.df)
  #       Month Year Unadj.Conc Adj.Conc
  #31      July 1985       2.31     2.23
  #32    August 1985       2.32     2.24
  #33 September 1985       2.28     2.23
  #34   October 1985       2.22     2.24
  #35  November 1985       2.19     2.25
  #36  December 1985       2.22     2.23


  # Plot the data
  #--------------
  Unadj.Conc <- EPA.09.Ex.14.8.df$Unadj.Conc
  Adj.Conc   <- EPA.09.Ex.14.8.df$Adj.Conc
  Month      <- EPA.09.Ex.14.8.df$Month
  Year       <- EPA.09.Ex.14.8.df$Year
  Time       <- paste(substring(Month, 1, 3), Year - 1900, sep = "-")
  n          <- length(Unadj.Conc)
  Three.Yr.Mean <- mean(Unadj.Conc)

  dev.new()
  par(mar = c(7, 4, 3, 1) + 0.1, cex.lab = 1.25)
  plot(1:n, Unadj.Conc, type = "n", xaxt = "n",
	xlab = "Time (Month)", 
	ylab = "ANALYTE CONCENTRATION (mg/L)", 
	main = "Figure 14-15. Seasonal Time Series Over a Three Year Period",
	cex.main = 1.1)
  axis(1, at = 1:n, labels = rep("", n))
  at <- rep(c(1, 5, 9), 3) + rep(c(0, 12, 24), each = 3)
  axis(1, at = at, labels = Time[at])
  points(1:n, Unadj.Conc, pch = 0, type = "o", lwd = 2)
  points(1:n, Adj.Conc, pch = 3, type = "o", col = 8, lwd = 2)
  abline(h = Three.Yr.Mean, lwd = 2)
  legend("topleft", c("Unadjusted", "Adjusted", "3-Year Mean"), bty = "n", 
    pch = c(0, 3, -1), lty = c(1, 1, 1), lwd = 2, col = c(1, 8, 1),
    inset = c(0.05, 0.01))


  # Perform the seasonal Kendall trend test
  #----------------------------------------

  kendallSeasonalTrendTest(Unadj.Conc ~ Month + Year, 
    data = EPA.09.Ex.14.8.df)

  #Results of Hypothesis Test
  #--------------------------
  #
  #Null Hypothesis:                 All 12 values of tau = 0
  #
  #Alternative Hypothesis:          The seasonal taus are not all equal
  #                                 (Chi-Square Heterogeneity Test)
  #                                 At least one seasonal tau != 0
  #                                 and all non-zero tau's have the
  #                                 same sign (z Trend Test)
  #
  #Test Name:                       Seasonal Kendall Test for Trend
  #                                 (with continuity correction)
  #
  #Estimated Parameter(s):          tau       =    0.9722222
  #                                 slope     =    0.0600000
  #                                 intercept = -131.7350000
  #
  #Estimation Method:               tau:        Weighted Average of
  #                                             Seasonal Estimates
  #                                 slope:      Hirsch et al.'s
  #                                             Modification of
  #                                             Thiel/Sen Estimator
  #                                 intercept:  Median of
  #                                             Seasonal Estimates
  #
  #Data:                            y      = Unadj.Conc
  #                                 season = Month     
  #                                 year   = Year      
  #
  #Data Source:                     EPA.09.Ex.14.8.df
  #
  #Sample Sizes:                    January   =  3
  #                                 February  =  3
  #                                 March     =  3
  #                                 April     =  3
  #                                 May       =  3
  #                                 June      =  3
  #                                 July      =  3
  #                                 August    =  3
  #                                 September =  3
  #                                 October   =  3
  #                                 November  =  3
  #                                 December  =  3
  #                                 Total     = 36
  #
  #Test Statistics:                 Chi-Square (Het) = 0.1071882
  #                                 z (Trend)        = 5.1849514
  #
  #Test Statistic Parameter:        df = 11
  #
  #P-values:                        Chi-Square (Het) = 1.000000e+00
  #                                 z (Trend)        = 2.160712e-07
  #
  #Confidence Interval for:         slope
  #
  #Confidence Interval Method:      Gilbert's Modification of
  #                                 Theil/Sen Method
  #
  #Confidence Interval Type:        two-sided
  #
  #Confidence Level:                95%
  #
  #Confidence Interval:             LCL = 0.05786914
  #                                 UCL = 0.07213086

  #==========

  # Clean up
  #---------

  rm(Unadj.Conc, Adj.Conc, Month, Year, Time, n, Three.Yr.Mean, at)
  graphics.off()



