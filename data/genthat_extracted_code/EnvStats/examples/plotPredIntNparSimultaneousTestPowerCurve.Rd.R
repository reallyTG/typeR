library(EnvStats)


### Name: plotPredIntNparSimultaneousTestPowerCurve
### Title: Power Curves for Sampling Design for Test Based on Nonparametric
###   Simultaneous Prediction Interval
### Aliases: plotPredIntNparSimultaneousTestPowerCurve
### Keywords: distribution design htest

### ** Examples

  # Example 19-5 of USEPA (2009, p. 19-33) shows how to compute nonparametric upper 
  # simultaneous prediction limits for various rules based on trace mercury data (ppb) 
  # collected in the past year from a site with four background wells and 10 compliance 
  # wells (data for two of the compliance wells  are shown in the guidance document).  
  # The facility must monitor the 10 compliance wells for five constituents 
  # (including mercury) annually.

  # We will pool data from 4 background wells that were sampled on 
  # a number of different occasions, giving us a sample size of 
  # n = 20 to use to construct the prediction limit.

  # There are 10 compliance wells and we will monitor 5 different 
  # constituents at each well annually.  For this example, USEPA (2009) 
  # recommends setting r to the product of the number of compliance wells and 
  # the number of evaluations per year (i.e., r = 10 * 1 = 10).  
 
  # Here we will reproduce Figure 19-2 on page 19-35.  This figure plots the 
  # power of the nonparametric simultaneous prediction interval for 6 different 
  # plans:
  #          Rule Median.n k m Order.Statistic Achieved.alpha BG.Limit
  #1)      k.of.m        1 1 3             Max         0.0055     0.28
  #2)      k.of.m        1 1 4             Max         0.0009     0.28
  #3) Modified.CA        1 1 4             Max         0.0140     0.28
  #4)      k.of.m        3 1 2             Max         0.0060     0.28
  #5)      k.of.m        1 1 4             2nd         0.0046     0.25
  #6)      k.of.m        1 1 4             3rd         0.0135     0.24

  # Here is the power curve for the 1-of-4 sampling strategy.

  dev.new()
  plotPredIntNparSimultaneousTestPowerCurve(n = 20, k = 1, m = 4, r = 10, 
    rule = "k.of.m", n.plus.one.minus.upl.rank = 3, pi.type = "upper", 
    r.shifted = 1, method = "approx", range.delta.over.sigma = c(0, 5), main = "")

  title(main = paste(
    "Power Curve for Nonparametric 1-of-4 Sampling Strategy Based on",
    "25 Background Samples, SWFPR=10%, and 2 Future Sampling Periods", 
    sep = "\n"), cex.main = 1.1)

  #----------

  # Here are the power curves for all 6 sampling strategies.  
  # Because these take several seconds to create, here we have commented out 
  # the R commands.  To run this example, just remove the pound signs (#) from 
  # in front of the R commands.

  #dev.new()
  #plotPredIntNparSimultaneousTestPowerCurve(n = 20, k = 1, m = 4, r = 10, 
  #  rule = "k.of.m", n.plus.one.minus.upl.rank = 3, pi.type = "upper", 
  #  r.shifted = 1, method = "approx", range.delta.over.sigma = c(0, 5), main = "")

  #plotPredIntNparSimultaneousTestPowerCurve(n = 20, n.median = 3, k = 1, m = 2, 
  #  r = 10, rule = "k.of.m", n.plus.one.minus.upl.rank = 1, pi.type = "upper", 
  #  r.shifted = 1, method = "approx", range.delta.over.sigma = c(0, 5), 
  #  add = TRUE, plot.col = 2, plot.lty = 2)

  #plotPredIntNparSimultaneousTestPowerCurve(n = 20, r = 10, rule = "Modified.CA", 
  #  n.plus.one.minus.upl.rank = 1, pi.type = "upper", r.shifted = 1, 
  #  method = "approx", range.delta.over.sigma = c(0, 5), add = TRUE, 
  #  plot.col = 3, plot.lty = 3)

  #plotPredIntNparSimultaneousTestPowerCurve(n = 20, k = 1, m = 4, r = 10, 
  #  rule = "k.of.m", n.plus.one.minus.upl.rank = 2, pi.type = "upper", 
  #  r.shifted = 1, method = "approx", range.delta.over.sigma = c(0, 5), 
  #  add = TRUE, plot.col = 4, plot.lty = 4)

  #plotPredIntNparSimultaneousTestPowerCurve(n = 20, k = 1, m = 3, r = 10, 
  #  rule = "k.of.m", n.plus.one.minus.upl.rank = 1, pi.type = "upper", 
  #  r.shifted = 1, method = "approx", range.delta.over.sigma = c(0, 5), 
  #  add = TRUE, plot.col = 5, plot.lty = 5)

  #plotPredIntNparSimultaneousTestPowerCurve(n = 20, k = 1, m = 4, r = 10, 
  #  rule = "k.of.m", n.plus.one.minus.upl.rank = 1, pi.type = "upper", 
  #  r.shifted = 1, method = "approx", range.delta.over.sigma = c(0, 5), 
  #  add = TRUE, plot.col = 6, plot.lty = 6)

  #legend("topleft", legend = c("1-of-4, 3rd", "1-of-2, Max, Median", "Mod CA", 
  #  "1-of-4, 2nd", "1-of-3, Max", "1-of-4, Max"), lwd = 3 * par("cex"), 
  #  col = 1:6, lty = 1:6, bty = "n")

  #title(main = "Figure 19-2. Comparison of Full Power Curves")

  #==========

  # Clean up
  #---------
  graphics.off()



