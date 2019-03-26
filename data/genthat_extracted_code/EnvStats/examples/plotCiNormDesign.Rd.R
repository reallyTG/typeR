library(EnvStats)


### Name: plotCiNormDesign
### Title: Plots for Sampling Design Based on Confidence Interval for Mean
###   of a Normal Distribution or Difference Between Two Means
### Aliases: plotCiNormDesign
### Keywords: distribution design htest

### ** Examples

  # Look at the relationship between half-width and sample size 
  # for a one-sample confidence interval for the mean, assuming 
  # an estimated standard deviation of 1 and a confidence level of 95%.

  dev.new()
  plotCiNormDesign()

  #--------------------------------------------------------------------

  # Plot sample size vs. the estimated standard deviation for 
  # various levels of confidence, using a half-width of 0.5.

  dev.new()
  plotCiNormDesign(x.var = "sigma.hat", y.var = "n", main = "") 

  plotCiNormDesign(x.var = "sigma.hat", y.var = "n", conf.level = 0.9, 
    add = TRUE, plot.col = 2) 

  plotCiNormDesign(x.var = "sigma.hat", y.var = "n", conf.level = 0.8, 
    add = TRUE, plot.col = 3) 

  legend(0.25, 60, c("95%", "90%", "80%"), lty = 1, lwd = 3, col = 1:3) 

  mtext("Sample Size vs. Estimated SD for Confidence Interval for Mean",
    font = 2, cex = 1.25, line = 2.75)
  mtext("with Half-Width=0.5 and Various Confidence Levels", font = 2, 
    cex = 1.25, line = 1.25)

  #--------------------------------------------------------------------

  # Modifying the example on pages 21-4 to 21-5 of USEPA (2009), 
  # look at the relationship between half-width and sample size for a 
  # 95% confidence interval for the mean level of Aldicarb at the 
  # first compliance well.  Use the estimated standard deviation from 
  # the first four months of data. 
  # (The data are stored in EPA.09.Ex.21.1.aldicarb.df.)

  EPA.09.Ex.21.1.aldicarb.df
  #   Month   Well Aldicarb.ppb
  #1      1 Well.1         19.9
  #2      2 Well.1         29.6
  #3      3 Well.1         18.7
  #4      4 Well.1         24.2
  #...

  mu.hat <- with(EPA.09.Ex.21.1.aldicarb.df, 
    mean(Aldicarb.ppb[Well=="Well.1"]))

  mu.hat 
  #[1] 23.1 

  sigma.hat <- with(EPA.09.Ex.21.1.aldicarb.df, 
    sd(Aldicarb.ppb[Well=="Well.1"]))

  sigma.hat 
  #[1] 4.93491 

  dev.new()
  plotCiNormDesign(sigma.hat = sigma.hat, digits = 2, 
    range.x.var = c(2, 25))

  #==========

  # Clean up
  #---------
  rm(mu.hat, sigma.hat)
  graphics.off()



