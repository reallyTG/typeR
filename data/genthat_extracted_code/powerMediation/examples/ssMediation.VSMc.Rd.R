library(powerMediation)


### Name: ssMediation.VSMc
### Title: Sample size for testing mediation effect in linear regression
###   based on Vittinghoff, Sen and McCulloch's (2009) method
### Aliases: ssMediation.VSMc
### Keywords: test

### ** Examples

  # example in section 3 (page 544) of Vittinghoff et al. (2009).
  # n=863
  ssMediation.VSMc(power = 0.80, b2 = 0.1, sigma.m = 1, sigma.e = 1, 
    corr.xm = 0.3, alpha = 0.05, verbose = TRUE)




