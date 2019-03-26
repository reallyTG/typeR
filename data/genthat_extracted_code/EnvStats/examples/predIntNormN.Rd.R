library(EnvStats)


### Name: predIntNormN
### Title: Sample Size for a Specified Half-Width of a Prediction Interval
###   for the next k Observations from a Normal Distribution
### Aliases: predIntNormN
### Keywords: distribution design htest

### ** Examples

  # Look at how the required sample size for a prediction interval increases 
  # with increasing number of future observations:

  1:5 
  #[1] 1 2 3 4 5 

  predIntNormN(half.width = 3, k = 1:5) 
  #[1]  6  9 11 14 18

  #----------

  # Look at how the required sample size for a prediction interval decreases 
  # with increasing half-width:

  2:5 
  #[1] 2 3 4 5 

  predIntNormN(half.width = 2:5) 
  #[1] 86  6  4  3

  predIntNormN(2:5, round = FALSE) 
  #[1] 85.567387  5.122911  3.542393  2.987861

  #----------

  # Look at how the required sample size for a prediction interval increases 
  # with increasing estimated standard deviation for a fixed half-width:

  seq(0.5, 2, by = 0.5) 
  #[1] 0.5 1.0 1.5 2.0 

  predIntNormN(half.width = 4, sigma.hat = seq(0.5, 2, by = 0.5)) 
  #[1]  3  4  7 86

  #----------

  # Look at how the required sample size for a prediction interval increases 
  # with increasing confidence level for a fixed half-width:

  seq(0.5, 0.9, by = 0.1) 
  #[1] 0.5 0.6 0.7 0.8 0.9 

  predIntNormN(half.width = 2, conf.level = seq(0.5, 0.9, by = 0.1)) 
  #[1] 2 2 3 4 9

  #==========

  # The data frame EPA.92c.arsenic3.df contains arsenic concentrations (ppb) 
  # collected quarterly for 3 years at a background well and quarterly for 
  # 2 years at a compliance well.  Using the data from the background well, 
  # compute the required sample size in order to achieve a half-width of 
  # 2.25, 2.5, or 3 times the estimated standard deviation for a two-sided 
  # 90% prediction interval for k=4 future observations.
  #
  # For a half-width of 2.25 standard deviations, the required sample size is 526, 
  # or about 131 years of quarterly observations!  For a half-width of 2.5 
  # standard deviations, the required sample size is 20, or about 5 years of 
  # quarterly observations.  For a half-width of 3 standard deviations, the required 
  # sample size is 9, or about 2 years of quarterly observations.

  EPA.92c.arsenic3.df
  #   Arsenic Year  Well.type
  #1     12.6    1 Background
  #2     30.8    1 Background
  #3     52.0    1 Background
  #...
  #18     3.8    5 Compliance
  #19     2.6    5 Compliance
  #20    51.9    5 Compliance

  mu.hat <- with(EPA.92c.arsenic3.df, 
    mean(Arsenic[Well.type=="Background"])) 

  mu.hat 
  #[1] 27.51667 

  sigma.hat <- with(EPA.92c.arsenic3.df, 
    sd(Arsenic[Well.type=="Background"]))

  sigma.hat 
  #[1] 17.10119 

  predIntNormN(half.width=c(2.25, 2.5, 3) * sigma.hat, k = 4, 
    sigma.hat = sigma.hat, conf.level = 0.9) 
  #[1] 526  20   9 

  #==========

  # Clean up
  #---------
  rm(mu.hat, sigma.hat)



