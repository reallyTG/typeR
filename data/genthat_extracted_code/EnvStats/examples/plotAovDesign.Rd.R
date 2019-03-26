library(EnvStats)


### Name: plotAovDesign
### Title: Create Plots for a Sampling Design Based on a One-Way
###   Fixed-Effects Analysis of Variance
### Aliases: plotAovDesign
### Keywords: design htest models regression hplot

### ** Examples

  # Look at the relationship between power and sample size 
  # for a one-way ANOVA, assuming k=2 groups, group means of 
  # 0 and 1, a population standard deviation of 1, and a 
  # 5% significance level:

  dev.new()
  plotAovDesign()

  #--------------------------------------------------------------------

  # Plot power vs. sample size for various levels of significance:

  dev.new()
  plotAovDesign(mu.vec = c(0, 0.5, 1), ylim=c(0, 1), main="") 

  plotAovDesign(mu.vec = c(0, 0.5, 1), alpha=0.1, add=TRUE, plot.col=2) 

  plotAovDesign(mu.vec = c(0, 0.5, 1), alpha=0.2, add=TRUE, plot.col=3) 

  legend(35, 0.6, c("20%", "10%", "   5%"), lty=1, lwd = 3, col=3:1, 
    bty = "n") 

  mtext("Power vs. Sample Size for One-Way ANOVA", line = 3, cex = 1.25)
  mtext(expression(paste("with ", mu, "=(0, 0.5, 1), ", sigma, 
    "=1, and Various Significance Levels", sep="")), 
    line = 1.5, cex = 1.25)

  #--------------------------------------------------------------------

  # The example on pages 5-11 to 5-14 of USEPA (1989b) shows 
  # log-transformed concentrations of lead (mg/L) at two 
  # background wells and four compliance wells, where 
  # observations were taken once per month over four months 
  # (the data are stored in EPA.89b.loglead.df).  
  # Assume the true mean levels at each well are 
  # 3.9, 3.9, 4.5, 4.5, 4.5, and 5, respectively.  Plot the 
  # power vs. sample size of a one-way ANOVA to test for mean 
  # differences between wells.  Use alpha=0.05, and assume the 
  # true standard deviation is equal to the one estimated 
  # from the data in this example.

  names(EPA.89b.loglead.df) 
  #[1] "LogLead"   "Month"     "Well"      "Well.type"

  # Perform the ANOVA and get the estimated sd 
  aov.list <- aov(LogLead ~ Well, data=EPA.89b.loglead.df) 

  summary(aov.list) 
  #            Df Sum Sq Mean Sq F value  Pr(>F)  
  #Well         5 5.7447 1.14895  3.3469 0.02599 *
  #Residuals   18 6.1791 0.34328                  
  #---
  #Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 '' 1
 
  # Now create the plot 
  dev.new()
  plotAovDesign(range.x.var = c(2, 20), 
    mu.vec = c(3.9,3.9,4.5,4.5,4.5,5), 
    sigma=sqrt(0.34), 
    ylim = c(0, 1), digits=2)

  # Clean up
  #---------
  rm(aov.list)
  graphics.off()



