library(EnvStats)


### Name: plotPredIntNormSimultaneousTestPowerCurve
### Title: Power Curves for Sampling Design for Test Based on Simultaneous
###   Prediction Interval for Normal Distribution
### Aliases: plotPredIntNormSimultaneousTestPowerCurve
### Keywords: distribution design htest

### ** Examples

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

  # The help file for predIntNormSimultaneousTestPower shows how to 
  # create the results below for various sampling plans:

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

  # Here is the power curve for the 1-of-4 sampling strategy:

  dev.new()
  plotPredIntNormSimultaneousTestPowerCurve(n = 25, k = 1, m = 4, r = 2, 
    rule="k.of.m", pi.type = "upper",  conf.level = conf.level,  
    xlab = "SD Units Above Background", main = "")

  title(main = paste(
    "Power Curve for 1-of-4 Sampling Strategy Based on 25 Background", 
    "Samples, SWFPR=10%, and 2 Future Sampling Periods", sep = "\n"))

  #----------

  # Here are the power curves for the first four sampling strategies.  
  # Because this takes several seconds to run, here we have commented out 
  # the R commands.  To run this example, just remove the pound signs (#) 
  # from in front of the R commands.

  #dev.new()
  #plotPredIntNormSimultaneousTestPowerCurve(n = 25, k = 1, m = 4, r = 2, 
  #  rule="k.of.m", pi.type = "upper",  conf.level = conf.level,  
  #  xlab = "SD Units Above Background", main = "")

  #plotPredIntNormSimultaneousTestPowerCurve(n = 25, k = 1, m = 3, r = 2, 
  #  rule="k.of.m", pi.type = "upper",  conf.level = conf.level, add = TRUE, 
  #  plot.col = "red", plot.lty = 2)

  #plotPredIntNormSimultaneousTestPowerCurve(n = 25, k = 1, m = 2, r = 2, 
  #  rule="k.of.m", pi.type = "upper",  conf.level = conf.level, add = TRUE, 
  #  plot.col = "blue", plot.lty = 3)

  #plotPredIntNormSimultaneousTestPowerCurve(n = 25, r = 2, rule="Modified.CA", 
  #  pi.type = "upper", conf.level = conf.level, add = TRUE, plot.col = "green3",
  #  plot.lty = 4)

  #legend(0, 1, c("1-of-4", "Modified CA", "1-of-3", "1-of-2"), 
  #  col = c("black", "green3", "red", "blue"), lty = c(1, 4, 2, 3),
  #  lwd = 3 * par("cex"), bty = "n") 

  #title(main = paste("Power Curves for 4 Sampling Strategies Based on 25 Background", 
  #  "Samples, SWFPR=10%, and 2 Future Sampling Periods", sep = "\n"))

  #----------

  # Here are the power curves for the last 3 sampling strategies.  
  # Because this takes several seconds to run, here we have commented out 
  # the R commands.  To run this example, just remove the pound signs (#) 
  # from in front of the R commands.

  #dev.new()
  #plotPredIntNormSimultaneousTestPowerCurve(n = 25, k = 1, m = 2, n.mean = 2, 
  #  r = 2, rule="k.of.m", pi.type = "upper", conf.level = conf.level, 
  #  xlab = "SD Units Above Background", main = "")

  #plotPredIntNormSimultaneousTestPowerCurve(n = 25, k = 1, m = 1, n.mean = 2, 
  #  r = 2, rule="k.of.m", pi.type = "upper", conf.level = conf.level, add = TRUE,
  #  plot.col = "red", plot.lty = 2)

  #plotPredIntNormSimultaneousTestPowerCurve(n = 25, k = 1, m = 1, n.mean = 3, 
  #  r = 2, rule="k.of.m", pi.type = "upper", conf.level = conf.level, add = TRUE,
  #  plot.col = "blue", plot.lty = 3)

  #legend(0, 1, c("1-of-2, Order 2", "1-of-1, Order 3", "1-of-1, Order 2"), 
  #  col = c("black", "blue", "red"), lty = c(1, 3, 2), lwd = 3 * par("cex"), 
  #  bty="n")

  #title(main = paste("Power Curves for 3 Sampling Strategies Based on 25 Background", 
  #  "Samples, SWFPR=10%, and 2 Future Sampling Periods", sep = "\n"))

  #==========

  # Clean up
  #---------
  rm(nc, nw, conf.level)
  graphics.off()



