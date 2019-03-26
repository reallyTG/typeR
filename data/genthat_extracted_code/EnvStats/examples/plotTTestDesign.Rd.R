library(EnvStats)


### Name: plotTTestDesign
### Title: Plots for a Sampling Design Based on a One- or Two-Sample t-Test
### Aliases: plotTTestDesign
### Keywords: distribution design htest

### ** Examples

  # Look at the relationship between power and sample size for a two-sample t-test, 
  # assuming a scaled difference of 0.5 and a 5% significance level:

  dev.new()
  plotTTestDesign(sample.type = "two")

  #----------

  # For a two-sample t-test, plot sample size vs. the scaled minimal detectable 
  # difference for various levels of power, using a 5% significance level:

  dev.new()
  plotTTestDesign(x.var = "delta.over.sigma", y.var = "n", sample.type = "two", 
    ylim = c(0, 110), main="") 

  plotTTestDesign(x.var = "delta.over.sigma", y.var = "n", sample.type = "two", 
    power = 0.9, add = TRUE, plot.col = "red") 

  plotTTestDesign(x.var = "delta.over.sigma", y.var = "n", sample.type = "two", 
    power = 0.8, add = TRUE, plot.col = "blue") 

  legend("topright", c("95%", "90%", "80%"), lty = 1, 
    lwd = 3 * par("cex"), col = c("black", "red", "blue"), bty = "n")

  title(main = paste("Sample Size vs. Scaled Difference for", 
    "Two-Sample t-Test, with Alpha=0.05 and Various Powers", 
    sep="\n"))

  #==========

  # Modifying the example on pages 21-4 to 21-5 of USEPA (2009), look at 
  # power versus scaled minimal detectable difference for various sample 
  # sizes in the context of the problem of using a one-sample t-test to 
  # compare the mean for the well with the MCL of 7 ppb.  Use alpha = 0.01, 
  # assume an upper one-sided alternative (i.e., compliance well mean larger 
  # than 7 ppb).

  dev.new()
  plotTTestDesign(x.var = "delta.over.sigma", y.var = "power", 
    range.x.var = c(0.5, 2), n.or.n1 = 8, alpha = 0.01, 
    alternative = "greater", ylim = c(0, 1), main = "")

  plotTTestDesign(x.var = "delta.over.sigma", y.var = "power", 
    range.x.var = c(0.5, 2), n.or.n1 = 6, alpha = 0.01, 
    alternative = "greater", add = TRUE, plot.col = "red")

  plotTTestDesign(x.var = "delta.over.sigma", y.var = "power", 
    range.x.var = c(0.5, 2), n.or.n1 = 4, alpha = 0.01, 
    alternative = "greater", add = TRUE, plot.col = "blue")

  legend("topleft", paste("N =", c(8, 6, 4)), lty = 1, lwd = 3 * par("cex"), 
    col = c("black", "red", "blue"), bty = "n")

  title(main = paste("Power vs. Scaled Difference for One-Sample t-Test", 
    "with Alpha=0.01 and Various Sample Sizes", sep="\n"))

  #==========

  # Clean up
  #---------
  graphics.off()



