library(EnvStats)


### Name: predIntNparConfLevel
### Title: Confidence Level for Nonparametric Prediction Interval for
###   Continuous Distribution
### Aliases: predIntNparConfLevel
### Keywords: distribution design htest

### ** Examples

  # Look at how the confidence level of a nonparametric prediction interval 
  # increases with increasing sample size:

  seq(5, 25, by = 5) 
  #[1] 5 10 15 20 25 

  round(predIntNparConfLevel(n = seq(5, 25, by = 5)), 2) 
  #[1] 0.67 0.82 0.87 0.90 0.92

  #---------

  # Look at how the confidence level of a nonparametric prediction interval 
  # decreases as the number of future observations increases:

  round(predIntNparConfLevel(n = 10, m = 1:5), 2) 
  #[1] 0.82 0.68 0.58 0.49 0.43

  #----------

  # Look at how the confidence level of a nonparametric prediction interval 
  # decreases with minimum number of observations that must be contained within 
  # the interval (k):

  round(predIntNparConfLevel(n = 10, k = 1:5, m = 5), 2) 
  #[1] 1.00 0.98 0.92 0.76 0.43

  #----------

  # Look at how the confidence level of a nonparametric prediction interval 
  # decreases with the rank of the lower prediction limit:

  round(predIntNparConfLevel(n = 10, lpl.rank = 1:5), 2) 
  #[1] 0.82 0.73 0.64 0.55 0.45

  #==========

  # Example 18-3 of USEPA (2009, p.18-19) shows how to construct 
  # a one-sided upper nonparametric prediction interval for the next 
  # 4 future observations of trichloroethylene (TCE) at a downgradient well.  
  # The data for this example are stored in EPA.09.Ex.18.3.TCE.df.  
  # There are 6 monthly observations of TCE (ppb) at 3 background wells, 
  # and 4 monthly observations of TCE at a compliance well.

  # Look at the data
  #-----------------

  EPA.09.Ex.18.3.TCE.df

  #   Month Well  Well.type TCE.ppb.orig TCE.ppb Censored
  #1      1 BW-1 Background           <5     5.0     TRUE
  #2      2 BW-1 Background           <5     5.0     TRUE
  #3      3 BW-1 Background            8     8.0    FALSE
  #...
  #22     4 CW-4 Compliance           <5     5.0     TRUE
  #23     5 CW-4 Compliance            8     8.0    FALSE
  #24     6 CW-4 Compliance           14    14.0    FALSE


  longToWide(EPA.09.Ex.18.3.TCE.df, "TCE.ppb.orig", "Month", "Well", 
    paste.row.name = TRUE)

  #        BW-1 BW-2 BW-3 CW-4
  #Month.1   <5    7   <5     
  #Month.2   <5  6.5   <5     
  #Month.3    8   <5 10.5  7.5
  #Month.4   <5    6   <5   <5
  #Month.5    9   12   <5    8
  #Month.6   10   <5    9   14


  # If we construct the prediction limit based on the background well
  # data using the maximum value as the upper prediction limit, 
  # the associated confidence level is only 82%.  
  #-----------------------------------------------------------------

  predIntNparConfLevel(n = 18, m = 4, pi.type = "upper")
  #[1] 0.8181818

  # We would have to collect an additional 18 observations to achieve a 
  # confidence level of at least 90%:

  predIntNparN(m = 4, pi.type = "upper", conf.level = 0.9)
  #[1] 36

  predIntNparConfLevel(n = 36, m = 4, pi.type = "upper")
  #[1] 0.9



