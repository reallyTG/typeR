library(EnvStats)


### Name: linearTrendTestScaledMds
### Title: Scaled Minimal Detectable Slope for a t-Test for Linear Trend
### Aliases: linearTrendTestScaledMds
### Keywords: distribution design htest

### ** Examples

  # Look at how the scaled minimal detectable slope for the t-test for linear 
  # trend increases with increasing required power:

  seq(0.5, 0.9, by = 0.1) 
  #[1] 0.5 0.6 0.7 0.8 0.9 

  scaled.mds <- linearTrendTestScaledMds(n = 10, power = seq(0.5, 0.9, by = 0.1)) 

  round(scaled.mds, 2) 
  #[1] 0.25 0.28 0.31 0.35 0.41

  #----------

  # Repeat the last example, but compute the scaled minimal detectable slopes 
  # based on the approximate power instead of the exact:

  scaled.mds <- linearTrendTestScaledMds(n = 10, power = seq(0.5, 0.9, by = 0.1), 
    approx = TRUE) 

  round(scaled.mds, 2) 
  #[1] 0.25 0.28 0.31 0.35 0.41

  #==========

  # Look at how the scaled minimal detectable slope for the t-test for linear trend 
  # decreases with increasing sample size:

  seq(10, 50, by = 10) 
  #[1] 10 20 30 40 50 

  scaled.mds <- linearTrendTestScaledMds(seq(10, 50, by = 10), alternative = "greater") 

  round(scaled.mds, 2) 
  #[1] 0.40 0.13 0.07 0.05 0.03

  #==========

  # Look at how the scaled minimal detectable slope for the t-test for linear trend 
  # decreases with increasing values of Type I error:

  scaled.mds <- linearTrendTestScaledMds(10, alpha = c(0.001, 0.01, 0.05, 0.1), 
    alternative="greater") 

  round(scaled.mds, 2) 
  #[1] 0.76 0.53 0.40 0.34

  #----------

  # Repeat the last example, but compute the scaled minimal detectable slopes 
  # based on the approximate power instead of the exact:
 
  scaled.mds <- linearTrendTestScaledMds(10, alpha = c(0.001, 0.01, 0.05, 0.1), 
    alternative="greater", approx = TRUE) 

  round(scaled.mds, 2) 
  #[1] 0.70 0.52 0.41 0.36

  #==========

  # Clean up
  #---------
  rm(scaled.mds)



