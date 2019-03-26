library(EnvStats)


### Name: predIntNormSimultaneousTestPower
### Title: Probability That at Least One Set of Future Observations
###   Violates the Given Rule Based on a Simultaneous Prediction Interval
###   for a Normal Distribution
### Aliases: predIntNormSimultaneousTestPower
### Keywords: distribution design htest

### ** Examples

  # For the k-of-m rule with n=4, k=1, m=3, and r=1, show how the power increases 
  # as delta.over.sigma increases. Assume a 95% upper prediction interval.

  predIntNormSimultaneousTestPower(n = 4, m = 3, delta.over.sigma = 0:2) 
  #[1] 0.0500000 0.2954156 0.7008558

  #----------

  # Look at how the power increases with sample size for an upper one-sided 
  # prediction interval using the k-of-m rule with k=1, m=3, r=20, 
  # delta.over.sigma=2, and a confidence level of 95%.

  predIntNormSimultaneousTestPower(n = c(4, 8), m = 3, r = 20, delta.over.sigma = 2) 
  #[1] 0.6075972 0.9240924

  #----------

  # Compare the power for the 1-of-3 rule with the power for the California and 
  # Modified California rules, based on a 95% upper prediction interval and 
  # delta.over.sigma=2.  Assume a sample size of n=8.  Note that in this case the 
  # power for the Modified California rule is greater than the power for the 
  # 1-of-3 rule and California rule.

  predIntNormSimultaneousTestPower(n = 8, k = 1, m = 3, delta.over.sigma = 2) 
  #[1] 0.788171 

  predIntNormSimultaneousTestPower(n = 8, m = 3, rule = "CA", delta.over.sigma = 2) 
  #[1] 0.7160434 

  predIntNormSimultaneousTestPower(n = 8, rule = "Modified.CA", delta.over.sigma = 2) 
  #[1] 0.8143687

  #----------

  # Show how the power for an upper 95% simultaneous prediction limit increases 
  # as the number of future sampling occasions r increases.  Here, we'll use the 
  # 1-of-3 rule with n=8 and delta.over.sigma=1.

  predIntNormSimultaneousTestPower(n = 8, k = 1, m = 3, r=c(1, 2, 5, 10), 
    delta.over.sigma = 1) 
  #[1] 0.3492512 0.4032111 0.4503603 0.4633773

  #==========

  # USEPA (2009) contains an example on page 19-23 that involves monitoring 
  # nw=100 compliance wells at a large facility with minimal natural spatial 
  # variation every 6 months for nc=20 separate chemicals.  
  # There are n=25 background measurements for each chemical to use to create
  # simultaneous prediction intervals.  We would like to determine which kind of
  # resampling plan based on normal distribution simultaneous prediction intervals to
  # use (1-of-m, 1-of-m based on means, or Modified California) in order to have
  # adequate power of detecting an increase in chemical concentration at any of the
  # 100 wells while at the same time maintaining a site-wide false positive rate
  # (SWFPR) of 10% per year over all 4,000 comparisons 
  # (100 wells x 20 chemicals x semi-annual sampling).

  # The function predIntNormSimultaneousTestPower includes the argument "r" 
  # that is the number of future sampling occasions (r=2 in this case because 
  # we are performing semi-annual sampling), so to compute the individual test 
  # Type I error level alpha.test (and thus the individual test confidence level), 
  # we only need to worry about the number of wells (100) and the number of 
  # constituents (20): alpha.test = 1-(1-alpha)^(1/(nw x nc)).  The individual 
  # confidence level is simply 1-alpha.test.  Plugging in 0.1 for alpha, 
  # 100 for nw, and 20 for nc yields an individual test confidence level of 
  # 1-alpha.test = 0.9999473.

  nc <- 20
  nw <- 100
  conf.level <- (1 - 0.1)^(1 / (nc * nw))
  conf.level
  #[1] 0.9999473

  # Now we can compute the power of any particular sampling strategy using
  # predIntNormSimultaneousTestPower.  For example, here is the power of 
  # detecting an increase of three standard deviations in concentration using 
  # the prediction interval based on the "1-of-2" resampling rule:

  predIntNormSimultaneousTestPower(n = 25, k = 1, m = 2, r = 2, rule = "k.of.m", 
    delta.over.sigma = 3,  pi.type = "upper", conf.level = conf.level)
  #[1] 0.3900202

  # The following commands will reproduce the table shown in Step 2 on page
  # 19-23 of USEPA (2009).  Because these commands can take more than a few 
  # seconds to execute, we have commented them out here.  To run this example, 
  # just remove the pound signs (#) that are in front of R commands.

  #rule.vec <- c(rep("k.of.m", 3), "Modified.CA",  rep("k.of.m", 3))

  #m.vec <- c(2, 3, 4, 4, 1, 2, 1)

  #n.mean.vec <- c(rep(1, 4), 2, 2, 3)

  #n.scenarios <- length(rule.vec)

  #K.vec <- numeric(n.scenarios)

  #Power.vec <- numeric(n.scenarios)

  #K.vec <- predIntNormSimultaneousK(n = 25, k = 1, m = m.vec,  n.mean = n.mean.vec, 
  #  r = 2, rule = rule.vec,  pi.type = "upper", conf.level = conf.level)

  #Power.vec <- predIntNormSimultaneousTestPower(n = 25, k = 1, m = m.vec, 
  #  n.mean = n.mean.vec, r = 2, rule = rule.vec,  delta.over.sigma = 3, 
  #  pi.type = "upper",  conf.level = conf.level)

  #Power.df <- data.frame(Rule = rule.vec, k = rep(1, n.scenarios),  m = m.vec, 
  #  N.Mean = n.mean.vec, K = round(K.vec, 2),  Power = round(Power.vec, 2),
  #  Total.Samples = m.vec * n.mean.vec)

  #Power.df

  #         Rule k m N.Mean    K Power Total.Samples
  #1      k.of.m 1 2      1 3.16  0.39             2
  #2      k.of.m 1 3      1 2.33  0.65             3
  #3      k.of.m 1 4      1 1.83  0.81             4
  #4 Modified.CA 1 4      1 2.57  0.71             4
  #5      k.of.m 1 1      2 3.62  0.41             2
  #6      k.of.m 1 2      2 2.33  0.85             4
  #7      k.of.m 1 1      3 2.99  0.71             3

  # The above table shows the K-multipliers for each prediction interval, along with
  # the power of detecting a change in concentration of three standard deviations at
  # any of the 100 wells during the course of a year, for each of the sampling
  # strategies considered.  The last three rows of the table correspond to sampling
  # strategies that involve using the mean of two or three observations.

  #==========

  # Clean up
  #---------
  rm(nc, nw, conf.level, rule.vec, m.vec, n.mean.vec, n.scenarios, K.vec, 
    Power.vec, Power.df)



