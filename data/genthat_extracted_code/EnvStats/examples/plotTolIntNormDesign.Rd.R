library(EnvStats)


### Name: plotTolIntNormDesign
### Title: Plots for a Sampling Design Based on a Tolerance Interval for a
###   Normal Distribution
### Aliases: plotTolIntNormDesign
### Keywords: distribution design htest

### ** Examples

  # Look at the relationship between half-width and sample size for a 
  # 95% beta-content tolerance interval, assuming an estimated standard 
  # deviation of 1 and a confidence level of 95%:

  dev.new()
  plotTolIntNormDesign()

  #==========

  # Plot half-width vs. coverage for various levels of confidence:

  dev.new()
  plotTolIntNormDesign(x.var = "coverage", y.var = "half.width", 
    ylim = c(0, 3.5), main="") 

  plotTolIntNormDesign(x.var = "coverage", y.var = "half.width", 
    conf.level = 0.9, add = TRUE, plot.col = "red") 

  plotTolIntNormDesign(x.var = "coverage", y.var = "half.width", 
    conf.level = 0.8, add = TRUE, plot.col = "blue") 

  legend("topleft", c("95%", "90%", "80%"), lty = 1, lwd = 3 * par("cex"), 
    col = c("black", "red", "blue"), bty = "n")

  title(main = paste("Half-Width vs. Coverage for Tolerance Interval", 
    "with Sigma Hat=1 and Various Confidence Levels", sep = "\n"))

  #==========

  # Example 17-3 of USEPA (2009, p. 17-17) shows how to construct a 
  # beta-content upper tolerance limit with 95% coverage and 95% 
  # confidence  using chrysene data and assuming a lognormal distribution.  
  # The data for this example are stored in EPA.09.Ex.17.3.chrysene.df, 
  # which contains chrysene concentration data (ppb) found in water 
  # samples obtained from two background wells (Wells 1 and 2) and 
  # three compliance wells (Wells 3, 4, and 5).  The tolerance limit 
  # is based on the data from the background wells.

  # Here we will first take the log of the data and then estimate the 
  # standard deviation based on the two background wells.  We will use this 
  # estimate of standard deviation to plot the half-widths of 
  # future tolerance intervals on the log-scale for various sample sizes.

  head(EPA.09.Ex.17.3.chrysene.df)
  #  Month   Well  Well.type Chrysene.ppb
  #1     1 Well.1 Background         19.7
  #2     2 Well.1 Background         39.2
  #3     3 Well.1 Background          7.8
  #4     4 Well.1 Background         12.8
  #5     1 Well.2 Background         10.2
  #6     2 Well.2 Background          7.2

  longToWide(EPA.09.Ex.17.3.chrysene.df, "Chrysene.ppb", "Month", "Well")
  #  Well.1 Well.2 Well.3 Well.4 Well.5
  #1   19.7   10.2   68.0   26.8   47.0
  #2   39.2    7.2   48.9   17.7   30.5
  #3    7.8   16.1   30.1   31.9   15.0
  #4   12.8    5.7   38.1   22.2   23.4

  summary.stats <- summaryStats(log(Chrysene.ppb) ~ Well.type, 
    data = EPA.09.Ex.17.3.chrysene.df)

  summary.stats
  #            N   Mean     SD Median    Min    Max
  #Background  8 2.5086 0.6279 2.4359 1.7405 3.6687
  #Compliance 12 3.4173 0.4361 3.4111 2.7081 4.2195

  sigma.hat <- summary.stats["Background", "SD"]
  sigma.hat
  #[1] 0.6279

  dev.new()
  plotTolIntNormDesign(x.var = "n", y.var = "half.width", 
    range.x.var = c(5, 40), sigma.hat = sigma.hat, cex.main = 1)

  #==========

  # Clean up
  #---------
  rm(summary.stats, sigma.hat)
  graphics.off()



