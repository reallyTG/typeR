library(EnvStats)


### Name: plotCiBinomDesign
### Title: Plots for Sampling Design Based on Confidence Interval for
###   Binomial Proportion or Difference Between Two Proportions
### Aliases: plotCiBinomDesign
### Keywords: design distribution htest hplot

### ** Examples

  # Look at the relationship between half-width and sample size 
  # for a one-sample confidence interval for a binomial proportion, 
  # assuming an estimated proportion of 0.5 and a confidence level of 
  # 95%.  The jigsaw appearance of the plot is the result of using the 
  # score method:

  dev.new()
  plotCiBinomDesign()

  #----------

  # Redo the example above, but use the traditional (and inaccurate)
  # Wald method.

  dev.new()
  plotCiBinomDesign(ci.method = "Wald")

  #--------------------------------------------------------------------

  # Plot sample size vs. the estimated proportion for various half-widths, 
  # using a 95% confidence level and the adjusted Wald method:

  # NOTE:  This example takes several seconds to run so it has been 
  #        commented out.  Simply remove the pound signs (#) from in front 
  #        of the R commands to run it.

  #dev.new()
  #plotCiBinomDesign(x.var = "p.hat", y.var = "n", 
  #    half.width = 0.04, ylim = c(0, 600), main = "",
  #    xlab = expression(hat(p))) 
  #
  #plotCiBinomDesign(x.var = "p.hat", y.var = "n", 
  #    half.width = 0.05, add = TRUE, plot.col = 2) 
  #
  #plotCiBinomDesign(x.var = "p.hat", y.var = "n", 
  #    half.width = 0.06, add = TRUE, plot.col = 3) 
  #
  #legend(0.5, 150, paste("Half-Width =", c(0.04, 0.05, 0.06)), 
  #    lty = rep(1, 3), lwd = rep(2, 3), col=1:3, bty = "n") 
  #
  #mtext(expression(paste("Sample Size vs. ", hat(p), 
  #  " for Confidence Interval for p")), line = 2.5, cex = 1.25)
  #mtext("with Confidence=95%  and Various Values of Half-Width", 
  #  line = 1.5, cex = 1.25)
  #mtext(paste("CI Method = Score Normal Approximation", 
  #  "with Continuity Correction"), line = 0.5)

  #--------------------------------------------------------------------

  # Modifying the example on pages 8-5 to 8-7 of USEPA (1989b), 
  # look at the relationship between half-width and sample size 
  # for a 95% confidence interval for the difference between the 
  # proportion of detects at the background and compliance wells. 
  # Use the estimated proportion of detects from the original data. 
  # (The data are stored in EPA.89b.cadmium.df.)  
  # Assume equal sample sizes at each well.

  EPA.89b.cadmium.df
  #   Cadmium.orig Cadmium Censored  Well.type
  #1           0.1   0.100    FALSE Background
  #2          0.12   0.120    FALSE Background
  #3           BDL   0.000     TRUE Background
  # ..........................................
  #86          BDL   0.000     TRUE Compliance
  #87          BDL   0.000     TRUE Compliance
  #88          BDL   0.000     TRUE Compliance

  p.hat.back <- with(EPA.89b.cadmium.df, 
    mean(!Censored[Well.type=="Background"]))

  p.hat.back 
  #[1] 0.3333333 

  p.hat.comp <- with(EPA.89b.cadmium.df,  
    mean(!Censored[Well.type=="Compliance"]))

  p.hat.comp 
  #[1] 0.375 

  dev.new()
  plotCiBinomDesign(p.hat.or.p1.hat = p.hat.back, 
      p2.hat = p.hat.comp, digits=3) 

  #==========

  # Clean up
  #---------
  rm(p.hat.back, p.hat.comp)
  graphics.off()



