library(EnvStats)


### Name: plotCiNparDesign
### Title: Plots for Sampling Design Based on Nonparametric Confidence
###   Interval for a Quantile
### Aliases: plotCiNparDesign
### Keywords: distribution design htest

### ** Examples

  # Look at the relationship between confidence level and sample size for 
  # a two-sided nonparametric confidence interval for the 90'th percentile.

  dev.new()
  plotCiNparDesign(p = 0.9)

  #----------

  # Plot sample size vs. quantile for various levels of confidence:

  dev.new()
  plotCiNparDesign(x.var = "p", y.var = "n", range.x.var = c(0.8, 0.95), 
    ylim = c(0, 60), main = "") 

  plotCiNparDesign(x.var = "p", y.var = "n", conf.level = 0.9, add = TRUE, 
    plot.col = 2, plot.lty = 2) 

  plotCiNparDesign(x.var = "p", y.var = "n", conf.level = 0.8, add = TRUE, 
    plot.col = 3, plot.lty = 3) 

  legend("topleft", c("95%", "90%", "80%"), lty = 1:3, col = 1:3, 
    lwd = 3 * par('cex'), bty = 'n') 

  title(main = paste("Sample Size vs. Quantile for ", 
    "Nonparametric CI for \nQuantile, with ", 
    "Various Confidence Levels", sep=""))

  #==========

  # Clean up
  #---------
  graphics.off()



