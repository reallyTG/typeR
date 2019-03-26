library(EnvStats)


### Name: plotPredIntLnormAltTestPowerCurve
### Title: Power Curves for Sampling Design for Test Based on Prediction
###   Interval for Lognormal Distribution
### Aliases: plotPredIntLnormAltTestPowerCurve
### Keywords: distribution htest

### ** Examples

  # Plot power vs. ratio of means for k=1 future observation for 
  # various sample sizes using a 5% significance level and assuming cv=1.

  dev.new()
  plotPredIntLnormAltTestPowerCurve(n = 8, k = 1, 
    range.ratio.of.means=c(1, 10), ylim = c(0, 1), main = "") 

  plotPredIntLnormAltTestPowerCurve(n = 16, k = 1, 
    range.ratio.of.means = c(1, 10), add = TRUE, plot.col = "red") 

  plotPredIntLnormAltTestPowerCurve(n = 32, k = 1, 
    range.ratio.of.means=c(1, 10), add = TRUE, plot.col = "blue") 

  legend("topleft", c("n=32", "n=16", "n=8"), lty = 1, lwd = 3 * par("cex"), 
    col = c("blue", "red", "black"), bty = "n")

  title(main = paste("Power vs. Ratio of Means for Upper Prediction Interval", 
    "with k=1, Confidence=95%, and Various Sample Sizes", sep="\n"))
  mtext("Assuming a Lognormal Distribution with CV = 1", line = 0)

  #==========

  ## Not run: 
##D   # Pages 6-16 to 6-17 of USEPA (2009) present EPA Reference Power Curves (ERPC)
##D   # for groundwater monitoring:
##D   #
##D   # "Since effect sizes discussed in the next section often cannot or have not been 
##D   # quantified, the Unified Guidance recommends using the ERPC as a suitable basis 
##D   # of comparison for proposed testing procedures.  Each reference power curve 
##D   # corresponds to one of three typical yearly statistical evaluation schedules - 
##D   # quarterly, semi-annual, or annual - and represents the cumulative power 
##D   # achievable during a single year at one well-constituent pair by a 99##D 
##D   # (normal) prediction limit based on n = 10 background measurements and one new 
##D   # measurement from the compliance well.
##D   #
##D   # Here we will create a variation of Figure 6-3 on page 6-17 based on 
##D   # using a lognormal distribution and plotting power versus ratio of the 
##D   # means assuming cv=1.
##D 
##D   dev.new()
##D   plotPredIntLnormAltTestPowerCurve(n = 10, k = 1, cv = 1, conf.level = 0.99, 
##D     range.ratio.of.means = c(1, 10), ylim = c(0, 1), main="")
##D 
##D   plotPredIntLnormAltTestPowerCurve(n = 10, k = 2, cv = 1, conf.level = 0.99, 
##D     range.ratio.of.means = c(1, 10), add = TRUE, plot.col = "red", plot.lty = 2)
##D 
##D   plotPredIntLnormAltTestPowerCurve(n = 10, k = 4, cv = 1, conf.level = 0.99, 
##D     range.ratio.of.means = c(1, 10), add = TRUE, plot.col = "blue", plot.lty = 3)
##D 
##D   legend("topleft", c("Quarterly", "Semi-Annual", "Annual"), lty = 3:1, 
##D     lwd = 3 * par("cex"), col = c("blue", "red", "black"), bty = "n") 
##D 
##D   title(main = paste("Power vs. Ratio of Means for Upper Prediction Interval with",
##D     "n=10, Confidence=99%, and Various Sampling Frequencies", sep="\n"))
##D   mtext("Assuming a Lognormal Distribution with CV = 1", line = 0)
##D   
## End(Not run)

  #==========

  # Clean up
  #---------
  graphics.off()




