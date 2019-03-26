library(EnvStats)


### Name: plotPredIntNparSimultaneousDesign
### Title: Plots for a Sampling Design Based on a Simultaneous
###   Nonparametric Prediction Interval
### Aliases: plotPredIntNparSimultaneousDesign
### Keywords: distribution design htest

### ** Examples

  # For the 1-of-3 rule with r=20 future sampling occasions, look at the 
  # relationship between confidence level and sample size for a one-sided 
  # upper simultaneous nonparametric prediction interval.

  dev.new()
  plotPredIntNparSimultaneousDesign(k = 1, m = 3, r = 20, range.x.var = c(2, 20))

  #==========

  # Plot confidence level vs. sample size for various values of number of 
  # future sampling occasions (r):

  dev.new()
  plotPredIntNparSimultaneousDesign(m = 3, r = 10, rule = "CA", 
    ylim = c(0, 1), main = "") 

  plotPredIntNparSimultaneousDesign(m = 3, r = 20, rule = "CA", add = TRUE, 
    plot.col = "red") 

  plotPredIntNparSimultaneousDesign(m = 3, r = 30, rule = "CA", add = TRUE, 
    plot.col = "blue") 

  legend("bottomright", c("r=10", "r=20", "r=30"), lty = 1, lwd = 3 * par("cex"), 
    col = c("black", "red", "blue"), bty = "n") 

  title(main = paste("Confidence Level vs. Sample Size for Simultaneous", 
    "Nonparametric PI with Various Values of r", sep="\n"))

  #==========

  # Modifying Example 19-5 of USEPA (2009, p. 19-33), plot confidence level 
  # versus sample size (number of background observations requried) for 
  # a 1-of-3 plan assuming r = 10 compliance wells (future sampling occasions).
  
  dev.new()
  plotPredIntNparSimultaneousDesign(k = 1, m = 3, r = 10, rule = "k.of.m")

  #==========

  # Clean up
  #---------
  graphics.off()



