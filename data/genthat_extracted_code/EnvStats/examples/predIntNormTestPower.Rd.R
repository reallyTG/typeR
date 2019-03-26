library(EnvStats)


### Name: predIntNormTestPower
### Title: Probability That at Least One Future Observation Falls Outside a
###   Prediction Interval for a Normal Distribution
### Aliases: predIntNormTestPower
### Keywords: distribution htest

### ** Examples

  # Show how the power increases as delta.over.sigma increases.  
  # Assume a 95% upper prediction interval.

  predIntNormTestPower(n = 4, delta.over.sigma = 0:2) 
  #[1] 0.0500000 0.1743014 0.3990892

  #----------

  # Look at how the power increases with sample size for a one-sided upper 
  # prediction interval with k=3, delta.over.sigma=2, and a confidence level 
  # of 95%.

  predIntNormTestPower(n = c(4, 8), k = 3, delta.over.sigma = 2) 
  #[1] 0.3578250 0.5752113

  #----------

  # Show how the power for an upper 95% prediction limit increases as the 
  # number of future observations k increases.  Here, we'll use n=20 and 
  # delta.over.sigma=1.

  predIntNormTestPower(n = 20, k = 1:3, delta.over.sigma = 1) 
  #[1] 0.2408527 0.2751074 0.2936486



