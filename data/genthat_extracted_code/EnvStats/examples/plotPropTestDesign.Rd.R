library(EnvStats)


### Name: plotPropTestDesign
### Title: Plots for Sampling Design Based on One- or Two-Sample Proportion
###   Test
### Aliases: plotPropTestDesign
### Keywords: distribution design htest

### ** Examples

  # Look at the relationship between power and sample size for a 
  # one-sample proportion test, assuming the true proportion is 0.6, the 
  # hypothesized proportion is 0.5, and a 5% significance level.  
  # Compute the power based on the normal approximation to the binomial 
  # distribution.

  dev.new()
  plotPropTestDesign()

  #----------

  # For a two-sample proportion test, plot sample size vs. the minimal detectable 
  # difference for various levels of power, using a 5% significance level and a 
  # two-sided alternative:

  dev.new()
  plotPropTestDesign(x.var = "delta", y.var = "n", sample.type = "two", 
    ylim = c(0, 2800), main="") 

  plotPropTestDesign(x.var = "delta", y.var = "n", sample.type = "two", 
    power = 0.9, add = TRUE, plot.col = "red") 

  plotPropTestDesign(x.var = "delta", y.var = "n", sample.type = "two", 
    power = 0.8, add = TRUE, plot.col = "blue") 

  legend("topright", c("95%", "90%", "80%"), lty = 1, 
    lwd = 3 * par("cex"), col = c("black", "red", "blue"), bty = "n") 

  title(main = paste("Sample Size vs. Minimal Detectable Difference for Two-Sample", 
    "Proportion Test with p2=0.5, Alpha=0.05 and Various Powers", sep = "\n"))

  #==========

  # Example 22-3 on page 22-20 of USEPA (2009) involves determining whether more than 
  # 10% of chlorine gas containers are stored at pressures above a compliance limit.  
  # We want to test the one-sided null hypothesis that 10% or fewer of the containers 
  # are stored at pressures greater than the compliance limit versus the alternative 
  # that more than 10% are stored at pressures greater than the compliance limit.  
  # We want to have at least 90% power of detecting a true proportion of 30% or 
  # greater, using a 5% Type I error level.

  # Here we will modify this example and create a plot of power versus 
  # sample size for various assumed minimal detactable differences, 
  # using a 5% Type I error level.


  dev.new()
  plotPropTestDesign(x.var = "n", y.var = "power", 
    sample.type = "one", alternative = "greater", 
    p0.or.p2 = 0.1, p.or.p1 = 0.25, 
    range.x.var = c(20, 50), ylim = c(0.6, 1), main = "")

  plotPropTestDesign(x.var = "n", y.var = "power", 
    sample.type = "one", alternative = "greater", 
    p0.or.p2 = 0.1, p.or.p1 = 0.3, 
    range.x.var = c(20, 50), add = TRUE, plot.col = "red") 

  plotPropTestDesign(x.var = "n", y.var = "power", 
    sample.type = "one", alternative = "greater", 
    p0.or.p2 = 0.1, p.or.p1 = 0.35, 
    range.x.var = c(20, 50), add = TRUE, plot.col = "blue") 

  legend("bottomright", c("p=0.35", "p=0.3", "p=0.25"), lty = 1, 
    lwd = 3 * par("cex"), col = c("blue", "red", "black"), bty = "n") 

  title(main = paste("Power vs. Sample Size for One-Sided One-Sample Proportion",
    "Test with p0=0.1, Alpha=0.05 and Various Detectable Differences", 
    sep = "\n"))

  #==========

  # Clean up
  #---------
  graphics.off()



