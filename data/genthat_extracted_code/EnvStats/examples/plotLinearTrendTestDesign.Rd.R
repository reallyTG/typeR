library(EnvStats)


### Name: plotLinearTrendTestDesign
### Title: Plots for a Sampling Design Based on a t-Test for Linear Trend
### Aliases: plotLinearTrendTestDesign
### Keywords: distribution design htest

### ** Examples

  # Look at the relationship between power and sample size for the t-test for 
  # liner trend, assuming a scaled slope of 0.1 and a 5% significance level:

  dev.new()
  plotLinearTrendTestDesign()

  #==========

  # Plot sample size vs. the scaled minimal detectable slope for various 
  # levels of power, using a 5% significance level:

  dev.new()
  plotLinearTrendTestDesign(x.var = "slope.over.sigma", y.var = "n", 
    ylim = c(0, 30), main = "") 

  plotLinearTrendTestDesign(x.var = "slope.over.sigma", y.var = "n", 
    power = 0.9, add = TRUE, plot.col = "red") 

  plotLinearTrendTestDesign(x.var = "slope.over.sigma", y.var = "n", 
    power = 0.8, add = TRUE, plot.col = "blue") 

  legend("topright", c("95%", "90%", "80%"), lty = 1, bty = "n", 
    lwd = 3 * par("cex"), col = c("black", "red", "blue")) 

  title(main = paste("Sample Size vs. Scaled Slope for t-Test for Linear Trend", 
    "with Alpha=0.05 and Various Powers", sep="\n"))

  #==========

  # Clean up
  #---------
  graphics.off()



