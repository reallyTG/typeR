library(EnvStats)


### Name: predIntNparN
### Title: Sample Size for a Nonparametric Prediction Interval for a
###   Continuous Distribution
### Aliases: predIntNparN
### Keywords: distribution design htest

### ** Examples

  # Look at how the required sample size for a nonparametric prediction interval 
  # increases with increasing confidence level:

  seq(0.5, 0.9, by = 0.1) 
  #[1] 0.5 0.6 0.7 0.8 0.9 

  predIntNparN(conf.level = seq(0.5, 0.9, by = 0.1)) 
  #[1] 3 4 6 9 19

  #----------

  # Look at how the required sample size for a nonparametric prediction interval 
  # increases with number of future observations (m):

  1:5
  #[1] 1 2 3 4 5

  predIntNparN(m = 1:5) 
  #[1] 39 78 116 155 193

  #----------

  # Look at how the required sample size for a nonparametric prediction interval 
  # increases with minimum number of observations that must be contained within 
  # the interval (k):

  predIntNparN(k = 1:5, m = 5) 
  #[1] 4 7 13 30 193

  #----------

  # Look at how the required sample size for a nonparametric prediction interval 
  # increases with the rank of the lower prediction limit:

  predIntNparN(lpl.rank = 1:5) 
  #[1]  39  59  79 100 119

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



