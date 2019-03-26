library(EnvStats)


### Name: tolIntNormHalfWidth
### Title: Half-Width of a Tolerance Interval for a Normal Distribution
### Aliases: tolIntNormHalfWidth
### Keywords: distribution design htest

### ** Examples

  # Look at how the half-width of a tolerance interval increases with 
  # increasing coverage:

  seq(0.5, 0.9, by=0.1) 
  #[1] 0.5 0.6 0.7 0.8 0.9 

  round(tolIntNormHalfWidth(n = 10, coverage = seq(0.5, 0.9, by = 0.1)), 2) 
  #[1] 1.17 1.45 1.79 2.21 2.84

  #----------

  # Look at how the half-width of a tolerance interval decreases with 
  # increasing sample size:

  2:5 
  #[1] 2 3 4 5 

  round(tolIntNormHalfWidth(n = 2:5), 2) 
  #[1] 37.67 9.92 6.37 5.08

  #----------

  # Look at how the half-width of a tolerance interval increases with 
  # increasing estimated standard deviation for a fixed sample size:

  seq(0.5, 2, by = 0.5) 
  #[1] 0.5 1.0 1.5 2.0 

  round(tolIntNormHalfWidth(n = 10, sigma.hat = seq(0.5, 2, by = 0.5)), 2) 
  #[1] 1.69 3.38 5.07 6.76

  #----------

  # Look at how the half-width of a tolerance interval increases with 
  # increasing confidence level for a fixed sample size:

  seq(0.5, 0.9, by = 0.1) 
  #[1] 0.5 0.6 0.7 0.8 0.9 

  round(tolIntNormHalfWidth(n = 5, conf = seq(0.5, 0.9, by = 0.1)), 2) 
  #[1] 2.34 2.58 2.89 3.33 4.15

  #==========

  # Example 17-3 of USEPA (2009, p. 17-17) shows how to construct a 
  # beta-content upper tolerance limit with 95% coverage and 95% 
  # confidence  using chrysene data and assuming a lognormal distribution.  
  # The data for this example are stored in EPA.09.Ex.17.3.chrysene.df, 
  # which contains chrysene concentration data (ppb) found in water 
  # samples obtained from two background wells (Wells 1 and 2) and 
  # three compliance wells (Wells 3, 4, and 5).  The tolerance limit 
  # is based on the data from the background wells.

  # Here we will first take the log of the data and then estimate the 
  # standard deviation based on the two background wells.  We will use this 
  # estimate of standard deviation to compute the half-widths of 
  # future tolerance intervals on the log-scale for various sample sizes.

  head(EPA.09.Ex.17.3.chrysene.df)
  #  Month   Well  Well.type Chrysene.ppb
  #1     1 Well.1 Background         19.7
  #2     2 Well.1 Background         39.2
  #3     3 Well.1 Background          7.8
  #4     4 Well.1 Background         12.8
  #5     1 Well.2 Background         10.2
  #6     2 Well.2 Background          7.2

  longToWide(EPA.09.Ex.17.3.chrysene.df, "Chrysene.ppb", "Month", "Well")
  #  Well.1 Well.2 Well.3 Well.4 Well.5
  #1   19.7   10.2   68.0   26.8   47.0
  #2   39.2    7.2   48.9   17.7   30.5
  #3    7.8   16.1   30.1   31.9   15.0
  #4   12.8    5.7   38.1   22.2   23.4

  summary.stats <- summaryStats(log(Chrysene.ppb) ~ Well.type, 
    data = EPA.09.Ex.17.3.chrysene.df)

  summary.stats
  #            N   Mean     SD Median    Min    Max
  #Background  8 2.5086 0.6279 2.4359 1.7405 3.6687
  #Compliance 12 3.4173 0.4361 3.4111 2.7081 4.2195

  sigma.hat <- summary.stats["Background", "SD"]
  sigma.hat
  #[1] 0.6279

  tolIntNormHalfWidth(n = c(4, 8, 16), sigma.hat = sigma.hat)
  #[1] 3.999681 2.343160 1.822759

  #==========

  # Clean up
  #---------
  rm(summary.stats, sigma.hat)



