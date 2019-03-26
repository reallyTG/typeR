library(powerMediation)


### Name: ssMediation.VSMc.poisson
### Title: Sample size for testing mediation effect in poisson regression
###   based on Vittinghoff, Sen and McCulloch's (2009) method
### Aliases: ssMediation.VSMc.poisson
### Keywords: test

### ** Examples

  # example in section 5 (page 546) of Vittinghoff et al. (2009).
  # n = 1239
  ssMediation.VSMc.poisson(power = 0.7998578, b2 = log(1.35), 
    sigma.m = sqrt(0.25 * (1 - 0.25)), EY = 0.5, corr.xm = 0.5,
    alpha = 0.05, verbose = TRUE)




