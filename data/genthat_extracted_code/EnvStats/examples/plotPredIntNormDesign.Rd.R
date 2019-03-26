library(EnvStats)


### Name: plotPredIntNormDesign
### Title: Plots for a Sampling Design Based on a Prediction Interval for
###   the Next k Observations from a Normal Distribution
### Aliases: plotPredIntNormDesign
### Keywords: distribution design htest

### ** Examples

  # Look at the relationship between half-width and sample size for a 
  # prediction interval for k=1 future observation, assuming an estimated 
  # standard deviation of 1 and a confidence level of 95%:

  dev.new()
  plotPredIntNormDesign()

  #==========

  # Plot sample size vs. the estimated standard deviation for various levels 
  # of confidence, using a half-width of 4:

  dev.new()
  plotPredIntNormDesign(x.var = "sigma.hat", y.var = "n", range.x.var = c(1, 2), 
    ylim = c(0, 90), main = "") 

  plotPredIntNormDesign(x.var = "sigma.hat", y.var = "n", range.x.var = c(1, 2), 
    conf.level = 0.9, add = TRUE, plot.col = "red") 

  plotPredIntNormDesign(x.var = "sigma.hat", y.var = "n", range.x.var = c(1, 2), 
    conf.level = 0.8, add = TRUE, plot.col = "blue") 

  legend("topleft", c("95%", "90%", "80%"), lty = 1, lwd = 3 * par("cex"), 
    col = c("black", "red", "blue"), bty = "n") 

  title(main = paste("Sample Size vs. Sigma Hat for Prediction Interval for", 
    "k=1 Future Obs, Half-Width=4, and Various Confidence Levels", 
    sep = "\n"))

  #==========

  # The data frame EPA.92c.arsenic3.df contains arsenic concentrations (ppb) 
  # collected quarterly for 3 years at a background well and quarterly for 
  # 2 years at a compliance well.  Using the data from the background well, 
  # plot the relationship between half-width and sample size for a two-sided 
  # 90% prediction interval for k=4 future observations.

  EPA.92c.arsenic3.df
  #   Arsenic Year  Well.type
  #1     12.6    1 Background
  #2     30.8    1 Background
  #3     52.0    1 Background
  #...
  #18     3.8    5 Compliance
  #19     2.6    5 Compliance
  #20    51.9    5 Compliance

  mu.hat <- with(EPA.92c.arsenic3.df, 
    mean(Arsenic[Well.type=="Background"])) 

  mu.hat 
  #[1] 27.51667 

  sigma.hat <- with(EPA.92c.arsenic3.df, 
    sd(Arsenic[Well.type=="Background"]))

  sigma.hat 
  #[1] 17.10119 

  dev.new()
  plotPredIntNormDesign(x.var = "n", y.var = "half.width", range.x.var = c(4, 50), 
    k = 4, sigma.hat = sigma.hat, conf.level = 0.9) 

  #==========

  # Clean up
  #---------
  rm(mu.hat, sigma.hat)
  graphics.off()



