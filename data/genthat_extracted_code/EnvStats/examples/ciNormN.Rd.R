library(EnvStats)


### Name: ciNormN
### Title: Sample Size for Specified Half-Width of Confidence Interval for
###   Normal Distribution Mean or Difference Between Two Means
### Aliases: ciNormN
### Keywords: distribution design htest

### ** Examples

  # Look at how the required sample size for a one-sample 
  # confidence interval decreases with increasing half-width:

  seq(0.25, 1, by = 0.25) 
  #[1] 0.25 0.50 0.75 1.00 

  ciNormN(half.width = seq(0.25, 1, by = 0.25)) 
  #[1] 64 18 10 7 

  ciNormN(seq(0.25, 1, by=0.25), round = FALSE) 
  #[1] 63.897899 17.832337  9.325967  6.352717

  #----------------------------------------------------------------

  # Look at how the required sample size for a one-sample 
  # confidence interval increases with increasing estimated 
  # standard deviation for a fixed half-width:

  seq(0.5, 2, by = 0.5) 
  #[1] 0.5 1.0 1.5 2.0 

  ciNormN(half.width = 0.5, sigma.hat = seq(0.5, 2, by = 0.5)) 
  #[1] 7 18 38 64

  #----------------------------------------------------------------

  # Look at how the required sample size for a one-sample 
  # confidence interval increases with increasing confidence 
  # level for a fixed half-width:

  seq(0.5, 0.9, by = 0.1) 
  #[1] 0.5 0.6 0.7 0.8 0.9 

  ciNormN(half.width = 0.25, conf.level = seq(0.5, 0.9, by = 0.1)) 
  #[1] 9 13 19 28 46

  #----------------------------------------------------------------

  # Modifying the example on pages 21-4 to 21-5 of USEPA (2009), 
  # determine the required sample size in order to achieve a 
  # half-width that is 10% of the observed mean (based on the first 
  # four months of observations) for the Aldicarb level at the first 
  # compliance well.  Assume a 95% confidence level and use the 
  # estimated standard deviation from the first four months of data. 
  # (The data are stored in EPA.09.Ex.21.1.aldicarb.df.) 
  #
  # The required sample size is 20, so almost two years of data are 
  # required assuming observations are taken once per month.

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

  ciNormN(half.width = 0.1 * mu.hat, sigma.hat = sigma.hat) 
  #[1] 20

  #----------
  # Clean up
  rm(mu.hat, sigma.hat)



