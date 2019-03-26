library(powerMediation)


### Name: powerMediation.VSMc.logistic
### Title: Power for testing mediation effect in logistic regression based
###   on Vittinghoff, Sen and McCulloch's (2009) method
### Aliases: powerMediation.VSMc.logistic
### Keywords: test

### ** Examples

  # example in section 4 (page 545) of Vittinghoff et al. (2009).
  # power = 0.8005793
  powerMediation.VSMc.logistic(n = 255, b2 = log(1.5), sigma.m = 1, 
    p = 0.5, corr.xm = 0.5, alpha = 0.05, verbose = TRUE)



