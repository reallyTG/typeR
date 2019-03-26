library(EnvStats)


### Name: predIntLnormAltTestPower
### Title: Probability That at Least One Future Observation Falls Outside a
###   Prediction Interval for a Lognormal Distribution
### Aliases: predIntLnormAltTestPower
### Keywords: distribution htest

### ** Examples

  # Show how the power increases as ratio.of.means increases.  Assume a 
  # 95% upper prediction interval.

  predIntLnormAltTestPower(n = 4, ratio.of.means = 1:3) 
  #[1] 0.0500000 0.1459516 0.2367793

  #----------

  # Look at how the power increases with sample size for an upper one-sided 
  # prediction interval with k=3, ratio.of.means=4, and a confidence level of 95%.

  predIntLnormAltTestPower(n = c(4, 8), k = 3, ratio.of.means = 4) 
  #[1] 0.2860952 0.4533567

  #----------

  # Show how the power for an upper 95% prediction limit increases as the 
  # number of future observations k increases.  Here, we'll use n=20 and 
  # ratio.of.means=2.

  predIntLnormAltTestPower(n = 20, k = 1:3, ratio.of.means = 2) 
  #[1] 0.1945886 0.2189538 0.2321562



