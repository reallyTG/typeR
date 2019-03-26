library(EnvStats)


### Name: predIntNormHalfWidth
### Title: Half-Width of a Prediction Interval for the next k Observations
###   from a Normal Distribution
### Aliases: predIntNormHalfWidth
### Keywords: distribution design htest

### ** Examples

  # Look at how the half-width of a prediction interval increases with 
  # increasing number of future observations:

  1:5 
  #[1] 1 2 3 4 5 

  hw <- predIntNormHalfWidth(n = 10, k = 1:5)

  round(hw, 2) 
  #[1] 2.37 2.82 3.08 3.26 3.41

  #----------

  # Look at how the half-width of a prediction interval decreases with 
  # increasing sample size:

  2:5 
  #[1] 2 3 4 5 

  hw <- predIntNormHalfWidth(n = 2:5)

  round(hw, 2) 
  #[1] 15.56  4.97  3.56  3.04

  #----------

  # Look at how the half-width of a prediction interval increases with 
  # increasing estimated standard deviation for a fixed sample size:

  seq(0.5, 2, by = 0.5) 
  #[1] 0.5 1.0 1.5 2.0 

  hw <- predIntNormHalfWidth(n = 10, sigma.hat = seq(0.5, 2, by = 0.5))

  round(hw, 2) 
  #[1] 1.19 2.37 3.56 4.75

  #----------

  # Look at how the half-width of a prediction interval increases with 
  # increasing confidence level for a fixed sample size:

  seq(0.5, 0.9, by = 0.1) 
  #[1] 0.5 0.6 0.7 0.8 0.9 

  hw <- predIntNormHalfWidth(n = 5, conf = seq(0.5, 0.9, by = 0.1))

  round(hw, 2) 
  #[1] 0.81 1.03 1.30 1.68 2.34

  #==========

  # The data frame EPA.92c.arsenic3.df contains arsenic concentrations (ppb) 
  # collected quarterly for 3 years at a background well and quarterly for 
  # 2 years at a compliance well.  Using the data from the background well, compute 
  # the half-width associated with sample sizes of 12 (3 years of quarterly data), 
  # 16 (4 years of quarterly data), and 20 (5 years of quarterly data) for a 
  # two-sided 90% prediction interval for k=4 future observations.

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

  hw <- predIntNormHalfWidth(n = c(12, 16, 20), k = 4, sigma.hat = sigma.hat, 
    conf.level = 0.9)

  round(hw, 2) 
  #[1] 46.16 43.89 42.64

  #==========

  # Clean up
  #---------
  rm(hw, mu.hat, sigma.hat)



