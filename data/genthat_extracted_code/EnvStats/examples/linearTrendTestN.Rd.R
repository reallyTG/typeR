library(EnvStats)


### Name: linearTrendTestN
### Title: Sample Size for a t-Test for Linear Trend
### Aliases: linearTrendTestN
### Keywords: distribution design htest

### ** Examples

  # Look at how the required sample size for the t-test for zero slope 
  # increases with increasing required power:

  seq(0.5, 0.9, by = 0.1) 
  #[1] 0.5 0.6 0.7 0.8 0.9 

  linearTrendTestN(slope.over.sigma = 0.1, power = seq(0.5, 0.9, by = 0.1)) 
  #[1] 18 19 21 22 25

  #----------

  # Repeat the last example, but compute the sample size based on the approximate 
  # power instead of the exact:

  linearTrendTestN(slope.over.sigma = 0.1, power = seq(0.5, 0.9, by = 0.1), 
    approx = TRUE) 
  #[1] 18 19 21 22 25

  #==========

  # Look at how the required sample size for the t-test for zero slope decreases 
  # with increasing scaled slope:

  seq(0.05, 0.2, by = 0.05) 
  #[1] 0.05 0.10 0.15 0.20 

  linearTrendTestN(slope.over.sigma = seq(0.05, 0.2, by = 0.05)) 
  #[1] 41 26 20 17

  #==========

  # Look at how the required sample size for the t-test for zero slope decreases 
  # with increasing values of Type I error:

  linearTrendTestN(slope.over.sigma = 0.1, alpha = c(0.001, 0.01, 0.05, 0.1)) 
  #[1] 33 29 26 25



