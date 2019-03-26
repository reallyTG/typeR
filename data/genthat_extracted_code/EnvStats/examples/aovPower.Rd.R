library(EnvStats)


### Name: aovPower
### Title: Compute the Power of a One-Way Fixed-Effects Analysis of
###   Variance
### Aliases: aovPower
### Keywords: design htest models regression

### ** Examples

  # Look at how the power of a one-way ANOVA increases 
  # with increasing sample size:

  aovPower(n.vec = rep(5, 3), mu.vec = c(10, 15, 20), sigma = 5) 
  #[1] 0.7015083 

  aovPower(n.vec = rep(10, 3), mu.vec = c(10, 15, 20), sigma = 5) 
  #[1] 0.9732551

  #----------------------------------------------------------------

  # Look at how the power of a one-way ANOVA increases 
  # with increasing variability in the population means:

  aovPower(n.vec = rep(5,3), mu.vec = c(10, 10, 11), sigma=5) 
  #[1] 0.05795739 

  aovPower(n.vec = rep(5, 3), mu.vec = c(10, 10, 15), sigma = 5) 
  #[1] 0.2831863 

  aovPower(n.vec = rep(5, 3), mu.vec = c(10, 13, 15), sigma = 5) 
  #[1] 0.2236093 

  aovPower(n.vec = rep(5, 3), mu.vec = c(10, 15, 20), sigma = 5) 
  #[1] 0.7015083

  #----------------------------------------------------------------

  # Look at how the power of a one-way ANOVA increases 
  # with increasing values of Type I error:

  aovPower(n.vec = rep(10,3), mu.vec = c(10, 12, 14), 
    sigma = 5, alpha = 0.001) 
  #[1] 0.02655785 

  aovPower(n.vec = rep(10,3), mu.vec = c(10, 12, 14), 
    sigma = 5, alpha = 0.01) 
  #[1] 0.1223527 

  aovPower(n.vec = rep(10,3), mu.vec = c(10, 12, 14), 
    sigma = 5, alpha = 0.05) 
  #[1] 0.3085313 

  aovPower(n.vec = rep(10,3), mu.vec = c(10, 12, 14), 
    sigma = 5, alpha = 0.1) 
  #[1] 0.4373292

  #==========

  # The example on pages 5-11 to 5-14 of USEPA (1989b) shows 
  # log-transformed concentrations of lead (mg/L) at two 
  # background wells and four compliance wells, where observations 
  # were taken once per month over four months (the data are 
  # stored in EPA.89b.loglead.df.)  Assume the true mean levels 
  # at each well are 3.9, 3.9, 4.5, 4.5, 4.5, and 5, respectively. 
  # Compute the power of a one-way ANOVA to test for mean 
  # differences between wells.  Use alpha=0.05, and assume the 
  # true standard deviation is equal to the one estimated from 
  # the data in this example.

  # First look at the data 
  names(EPA.89b.loglead.df)
  #[1] "LogLead"   "Month"     "Well"      "Well.type"

  dev.new()
  stripChart(LogLead ~ Well, data = EPA.89b.loglead.df,
    show.ci = FALSE, xlab = "Well Number", 
    ylab="Log [ Lead (ug/L) ]", 
    main="Lead Concentrations at Six Wells")

  # Note: The assumption of a constant variance across 
  # all wells is suspect.


  # Now perform the ANOVA and get the estimated sd 
  aov.list <- aov(LogLead ~ Well, data=EPA.89b.loglead.df) 

  summary(aov.list) 
  #            Df Sum Sq Mean Sq F value  Pr(>F)  
  #Well         5 5.7447 1.14895  3.3469 0.02599 *
  #Residuals   18 6.1791 0.34328                  
  #---
  #Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 '' 1 

  # Now call the function aovPower 
  aovPower(n.vec = rep(4, 6), 
    mu.vec = c(3.9,3.9,4.5,4.5,4.5,5), sigma=sqrt(0.34)) 
  #[1] 0.5523148

  # Clean up
  rm(aov.list)



