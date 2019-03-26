library(EnvStats)


### Name: plotPredIntNormTestPowerCurve
### Title: Power Curves for Sampling Design for Test Based on Prediction
###   Interval for Normal Distribution
### Aliases: plotPredIntNormTestPowerCurve
### Keywords: distribution htest

### ** Examples

  # Pages 6-16 to 6-17 of USEPA (2009) present EPA Reference Power Curves (ERPC)
  # for groundwater monitoring:
  #
  # "Since effect sizes discussed in the next section often cannot or have not been 
  # quantified, the Unified Guidance recommends using the ERPC as a suitable basis 
  # of comparison for proposed testing procedures.  Each reference power curve 
  # corresponds to one of three typical yearly statistical evaluation schedules - 
  # quarterly, semi-annual, or annual - and represents the cumulative power 
  # achievable during a single year at one well-constituent pair by a 99% upper 
  # (normal) prediction limit based on n = 10 background measurements and one new 
  # measurement from the compliance well.
  #
  # Here we will reproduce Figure 6-3 on page 6-17.

  dev.new()
  plotPredIntNormTestPowerCurve(n = 10, k = 1, conf.level = 0.99, 
    ylim = c(0, 1), main="")

  plotPredIntNormTestPowerCurve(n = 10, k = 2, conf.level = 0.99, 
    add = TRUE, plot.col = "red", plot.lty = 2)

  plotPredIntNormTestPowerCurve(n = 10, k = 4, conf.level = 0.99, 
    add = TRUE, plot.col = "blue", plot.lty = 3)

  legend("topleft", c("Quarterly", "Semi-Annual", "Annual"), lty = 3:1, 
    lwd = 3 * par("cex"), col = c("blue", "red", "black"), bty = "n") 

  title(main = paste("Power vs. Delta/Sigma for Upper Prediction Interval with",
    "n=10, Confidence=99%, and Various Sampling Frequencies", sep="\n"))

  #==========
## Not run: 
##D   # Plot power vs. scaled minimal detectable difference for various sample sizes 
##D   # using a 5##D 
##D 
##D   dev.new()
##D   plotPredIntNormTestPowerCurve(n = 8, k = 1, ylim = c(0, 1), main="") 
##D 
##D   plotPredIntNormTestPowerCurve(n = 16, k = 1, add = TRUE, plot.col = "red") 
##D 
##D   plotPredIntNormTestPowerCurve(n = 32, k = 1, add = TRUE, plot.col = "blue") 
##D 
##D   legend("bottomright", c("n=32", "n=16", "n=8"), lty = 1, lwd = 3 * par("cex"), 
##D     col = c("blue", "red", "black"), bty = "n") 
##D 
##D   title(main = paste("Power vs. Delta/Sigma for Upper Prediction Interval with",
##D     "k=1, Confidence=95%, and Various Sample Sizes", sep="\n"))
##D 
##D   #==========
##D 
##D   # Clean up
##D   #---------
##D   graphics.off()
## End(Not run)



