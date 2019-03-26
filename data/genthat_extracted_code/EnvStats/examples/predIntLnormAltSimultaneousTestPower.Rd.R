library(EnvStats)


### Name: predIntLnormAltSimultaneousTestPower
### Title: Probability That at Least One Set of Future Observations
###   Violates the Given Rule Based on a Simultaneous Prediction Interval
###   for a Lognormal Distribution
### Aliases: predIntLnormAltSimultaneousTestPower
### Keywords: distribution htest

### ** Examples

  # For the k-of-m rule with n=4, k=1, m=3, and r=1, show how the power increases 
  # as ratio.of.means increases.  Assume a 95% upper prediction interval.

  predIntLnormAltSimultaneousTestPower(n = 4, m = 3, ratio.of.means = 1:3) 
  #[1] 0.0500000 0.2356914 0.4236723

  #----------

  # Look at how the power increases with sample size for an upper one-sided 
  # prediction interval using the k-of-m rule with k=1, m=3, r=20, 
  # ratio.of.means=4, and a confidence level of 95%.

  predIntLnormAltSimultaneousTestPower(n = c(4, 8), m = 3, r = 20, ratio.of.means = 4) 
  #[1] 0.4915743 0.8218175

  #----------

  # Compare the power for the 1-of-3 rule with the power for the California and 
  # Modified California rules, based on a 95% upper prediction interval and 
  # ratio.of.means=4.  Assume a sample size of n=8.  Note that in this case the 
  # power for the Modified California rule is greater than the power for the 
  # 1-of-3 rule and California rule.

  predIntLnormAltSimultaneousTestPower(n = 8, k = 1, m = 3, ratio.of.means = 4) 
  #[1] 0.6594845 

  predIntLnormAltSimultaneousTestPower(n = 8, m = 3, rule = "CA", ratio.of.means = 4) 
  #[1] 0.5864311 

  predIntLnormAltSimultaneousTestPower(n = 8, rule = "Modified.CA", ratio.of.means = 4) 
  #[1] 0.691135

  #----------

  # Show how the power for an upper 95% simultaneous prediction limit increases 
  # as the number of future sampling occasions r increases.  Here, we'll use the 
  # 1-of-3 rule with n=8 and ratio.of.means=4.

  predIntLnormAltSimultaneousTestPower(n = 8, k = 1, m = 3, r = c(1, 2, 5, 10), 
    ratio.of.means = 4) 
  #[1] 0.6594845 0.7529576 0.8180814 0.8302302



