library(EnvStats)


### Name: ciNormHalfWidth
### Title: Half-Width of Confidence Interval for Normal Distribution Mean
###   or Difference Between Two Means
### Aliases: ciNormHalfWidth
### Keywords: distribution design htest

### ** Examples

  # Look at how the half-width of a one-sample confidence interval 
  # decreases with increasing sample size:

  seq(5, 30, by = 5) 
  #[1] 5 10 15 20 25 30 

  hw <- ciNormHalfWidth(n.or.n1 = seq(5, 30, by = 5)) 

  round(hw, 2) 
  #[1] 1.24 0.72 0.55 0.47 0.41 0.37

  #----------------------------------------------------------------

  # Look at how the half-width of a one-sample confidence interval 
  # increases with increasing estimated standard deviation:

  seq(0.5, 2, by = 0.5) 
  #[1] 0.5 1.0 1.5 2.0 

  hw <- ciNormHalfWidth(n.or.n1 = 20, sigma.hat = seq(0.5, 2, by = 0.5)) 

  round(hw, 2) 
  #[1] 0.23 0.47 0.70 0.94

  #----------------------------------------------------------------

  # Look at how the half-width of a one-sample confidence interval 
  # increases with increasing confidence level:

  seq(0.5, 0.9, by = 0.1) 
  #[1] 0.5 0.6 0.7 0.8 0.9 

  hw <- ciNormHalfWidth(n.or.n1 = 20, conf.level = seq(0.5, 0.9, by = 0.1)) 

  round(hw, 2) 
  #[1] 0.15 0.19 0.24 0.30 0.39

  #==========

  # Modifying the example on pages 21-4 to 21-5 of USEPA (2009), 
  # determine how adding another four months of observations to 
  # increase the sample size from 4 to 8 will affect the half-width 
  # of a two-sided 95% confidence interval for the Aldicarb level at 
  # the first compliance well.
  #  
  # Use the estimated standard deviation from the first four months 
  # of data.  (The data are stored in EPA.09.Ex.21.1.aldicarb.df.) 
  # Note that the half-width changes from 34% of the observed mean to 
  # 18% of the observed mean by increasing the sample size from 
  # 4 to 8.

  EPA.09.Ex.21.1.aldicarb.df
  #   Month   Well Aldicarb.ppb
  #1      1 Well.1         19.9
  #2      2 Well.1         29.6
  #3      3 Well.1         18.7
  #4      4 Well.1         24.2
  #...

  mu.hat <- with(EPA.09.Ex.21.1.aldicarb.df, 
    mean(Aldicarb.ppb[Well=="Well.1"]))

  mu.hat 
  #[1] 23.1 

  sigma.hat <- with(EPA.09.Ex.21.1.aldicarb.df, 
    sd(Aldicarb.ppb[Well=="Well.1"]))

  sigma.hat 
  #[1] 4.93491 

  hw.4 <- ciNormHalfWidth(n.or.n1 = 4, sigma.hat = sigma.hat) 

  hw.4 
  #[1] 7.852543 

  hw.8 <- ciNormHalfWidth(n.or.n1 = 8, sigma.hat = sigma.hat) 

  hw.8 
  #[1] 4.125688 

  100 * hw.4/mu.hat 
  #[1] 33.99369 

  100 * hw.8/mu.hat 
  #[1] 17.86012

  #==========

  # Clean up
  #---------
  rm(hw, mu.hat, sigma.hat, hw.4, hw.8)



