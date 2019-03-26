library(EnvStats)


### Name: plotPredIntNparDesign
### Title: Plots for a Sampling Design Based on a Nonparametric Prediction
###   Interval
### Aliases: plotPredIntNparDesign
### Keywords: distribution design htest

### ** Examples

  # Look at the relationship between confidence level and sample size for a 
  # two-sided nonparametric prediction interval for the next m=1 future observation.

  dev.new()
  plotPredIntNparDesign()

  #==========

  # Plot confidence level vs. sample size for various values of number of 
  # future observations (m):

  dev.new()
  plotPredIntNparDesign(k = 1, m = 1, ylim = c(0, 1), main = "") 

  plotPredIntNparDesign(k = 2, m = 2, add = TRUE, plot.col = "red") 

  plotPredIntNparDesign(k = 3, m = 3, add = TRUE, plot.col = "blue") 

  legend("bottomright", c("m=1", "m=2", "m=3"), lty = 1, lwd = 3 * par("cex"), 
    col = c("black", "red", "blue"), bty = "n") 

  title(main = paste("Confidence Level vs. Sample Size for Nonparametric PI", 
    "with Various Values of m", sep="\n"))

  #==========

  # Example 18-3 of USEPA (2009, p.18-19) shows how to construct 
  # a one-sided upper nonparametric prediction interval for the next 
  # 4 future observations of trichloroethylene (TCE) at a downgradient well.  
  # The data for this example are stored in EPA.09.Ex.18.3.TCE.df.  
  # There are 6 monthly observations of TCE (ppb) at 3 background wells, 
  # and 4 monthly observations of TCE at a compliance well.
  #
  # Modify this example by creating a plot to look at confidence level versus 
  # sample size (i.e., number of observations at the background wells) for 
  # predicting the next m = 4 future observations when constructing a one-sided 
  # upper prediction interval based on the maximum value.

  dev.new()
  plotPredIntNparDesign(k = 4, m = 4, pi.type = "upper")

  #==========

  # Clean up
  #---------
  graphics.off()



