library(EnvStats)


### Name: plotTTestLnormAltDesign
### Title: Plots for a Sampling Design Based on a One- or Two-Sample
###   t-Test, Assuming Lognormal Data
### Aliases: plotTTestLnormAltDesign
### Keywords: distribution design htest

### ** Examples

  # Look at the relationship between power and sample size for a two-sample t-test, 
  # assuming lognormal data, a ratio of means of 2, a coefficient of variation 
  # of 1, and a 5% significance level:

  dev.new()
  plotTTestLnormAltDesign(sample.type = "two")

  #----------

  # For a two-sample t-test based on lognormal data, plot sample size vs. the 
  # minimal detectable ratio for various levels of power, assuming a coefficient 
  # of variation of 1 and using a 5% significance level:

  dev.new()
  plotTTestLnormAltDesign(x.var = "ratio.of.means", y.var = "n", 
    range.x.var = c(1.5, 2), sample.type = "two", ylim = c(20, 120), main="") 

  plotTTestLnormAltDesign(x.var = "ratio.of.means", y.var = "n", 
    range.x.var = c(1.5, 2), sample.type="two", power = 0.9, 
    add = TRUE, plot.col = "red") 

  plotTTestLnormAltDesign(x.var = "ratio.of.means", y.var = "n", 
    range.x.var = c(1.5, 2), sample.type="two", power = 0.8, 
    add = TRUE, plot.col = "blue") 

  legend("topright", c("95%", "90%", "80%"), lty=1, lwd = 3*par("cex"), 
    col = c("black", "red", "blue"), bty = "n") 

  title(main = paste("Sample Size vs. Ratio of Lognormal Means for", 
    "Two-Sample t-Test, with CV=1, Alpha=0.05 and Various Powers", 
    sep="\n")) 

  #==========

  # The guidance document Soil Screening Guidance: Technical Background Document 
  # (USEPA, 1996c, Part 4) discusses sampling design and sample size calculations 
  # for studies to determine whether the soil at a potentially contaminated site 
  # needs to be investigated for possible remedial action. Let 'theta' denote the 
  # average concentration of the chemical of concern.  The guidance document 
  # establishes the following goals for the decision rule (USEPA, 1996c, p.87):
  #
  #     Pr[Decide Don't Investigate | theta > 2 * SSL] = 0.05
  #
  #     Pr[Decide to Investigate | theta <= (SSL/2)] = 0.2
  #
  # where SSL denotes the pre-established soil screening level.
  #
  # These goals translate into a Type I error of 0.2 for the null hypothesis
  #
  #     H0: [theta / (SSL/2)] <= 1
  #
  # and a power of 95% for the specific alternative hypothesis
  #
  #     Ha: [theta / (SSL/2)] = 4
  #
  # Assuming a lognormal distribution, a coefficient of variation of 2, and the above 
  # values for Type I error and power, create a performance goal diagram 
  # (USEPA, 1996c, p.89) showing the power of a one-sample test versus the minimal 
  # detectable ratio of theta/(SSL/2) when the sample size is 6 and the exact power 
  # calculations are used.

  dev.new()
  plotTTestLnormAltDesign(x.var = "ratio.of.means", y.var = "power", 
    range.x.var = c(1, 5), n.or.n1 = 6, cv = 2, alpha = 0.2, 
    alternative = "greater", approx = FALSE, ylim = c(0.2, 1), 
    xlab = "theta / (SSL/2)") 

  #==========

  # Clean up
  #---------
  graphics.off()



