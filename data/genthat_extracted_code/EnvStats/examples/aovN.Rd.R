library(EnvStats)


### Name: aovN
### Title: Compute Sample Size Necessary to Achieve Specified Power for
###   One-Way Fixed-Effects Analysis of Variance
### Aliases: aovN
### Keywords: design htest models regression

### ** Examples

  # Look at how the required sample size for a one-way ANOVA 
  # increases with increasing power:

  aovN(mu.vec = c(10, 12, 15), sigma = 5, power = 0.8) 
  #[1] 21 

  aovN(mu.vec = c(10, 12, 15), sigma = 5, power = 0.9) 
  #[1] 27 

  aovN(mu.vec = c(10, 12, 15), sigma = 5, power = 0.95) 
  #[1] 33

  #----------------------------------------------------------------

  # Look at how the required sample size for a one-way ANOVA, 
  # given a fixed power, decreases with increasing variability 
  # in the population means:

  aovN(mu.vec = c(10, 10, 11), sigma=5) 
  #[1] 581 

  aovN(mu.vec = c(10, 10, 15), sigma = 5) 
  #[1] 25 

  aovN(mu.vec = c(10, 13, 15), sigma = 5) 
  #[1] 33 

  aovN(mu.vec = c(10, 15, 20), sigma = 5) 
  #[1] 10

  #----------------------------------------------------------------

  # Look at how the required sample size for a one-way ANOVA, 
  # given a fixed power, decreases with increasing values of 
  # Type I error:

  aovN(mu.vec = c(10, 12, 14), sigma = 5, alpha = 0.001) 
  #[1] 89 

  aovN(mu.vec = c(10, 12, 14), sigma = 5, alpha = 0.01) 
  #[1] 67 

  aovN(mu.vec = c(10, 12, 14), sigma = 5, alpha = 0.05) 
  #[1] 50 

  aovN(mu.vec = c(10, 12, 14), sigma = 5, alpha = 0.1) 
  #[1] 42



