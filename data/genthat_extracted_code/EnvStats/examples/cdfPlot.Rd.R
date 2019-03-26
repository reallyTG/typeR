library(EnvStats)


### Name: cdfPlot
### Title: Plot Cumulative Distribution Function
### Aliases: cdfPlot 'Cumulative Distribution' 'Plot Cumulative
###   Distribution' 'Plot CDF'
### Keywords: distribution hplot

### ** Examples

  # Plot the cdf of the standard normal distribution 
  #-------------------------------------------------
  dev.new()
  cdfPlot()

  #==========

  # Plot the cdf of the standard normal distribution
  # and a N(2, 2) distribution on the sample plot. 
  #-------------------------------------------------
  dev.new()
  cdfPlot(param.list = list(mean=2, sd=2), main = "") 

  cdfPlot(add = TRUE, cdf.col = "red") 

  legend("topleft", legend = c("N(2,2)", "N(0,1)"), 
    col = c("black", "red"), lwd = 3 * par("cex")) 

  title("CDF Plots for Two Normal Distributions")
 
  #==========

  # Clean up
  #---------
  graphics.off()



