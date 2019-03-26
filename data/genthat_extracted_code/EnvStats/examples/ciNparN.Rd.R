library(EnvStats)


### Name: ciNparN
### Title: Sample Size for Nonparametric Confidence Interval for a Quantile
### Aliases: ciNparN
### Keywords: distribution design htest

### ** Examples

  # Look at how the required sample size for a confidence interval 
  # increases with increasing confidence level for a fixed quantile:

  seq(0.5, 0.9, by = 0.1) 
  #[1] 0.5 0.6 0.7 0.8 0.9 

  ciNparN(p = 0.9, conf.level=seq(0.5, 0.9, by = 0.1)) 
  #[1]  7  9 12 16 22

  #----------

  # Look at how the required sample size for a confidence interval increases 
  # as the quantile moves away from 0.5:

  ciNparN(p = seq(0.5, 0.9, by = 0.1)) 
  #[1]  6  7  9 14 29



