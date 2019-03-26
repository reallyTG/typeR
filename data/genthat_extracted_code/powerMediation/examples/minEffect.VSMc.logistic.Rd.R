library(powerMediation)


### Name: minEffect.VSMc.logistic
### Title: Minimum detectable slope for mediator in logistic regression
###   based on Vittinghoff, Sen and McCulloch's (2009) method
### Aliases: minEffect.VSMc.logistic
### Keywords: test

### ** Examples

  # example in section 4 (page 545) of Vittinghoff et al. (2009).
  # minimum effect is log(1.5)= 0.4054651 

  minEffect.VSMc.logistic(n = 255, power = 0.8, sigma.m = 1, 
    p = 0.5, corr.xm = 0.5, alpha = 0.05, verbose = TRUE)




