library(powerMediation)


### Name: minEffect.VSMc.poisson
### Title: Minimum detectable slope for mediator in poisson regression
###   based on Vittinghoff, Sen and McCulloch's (2009) method
### Aliases: minEffect.VSMc.poisson
### Keywords: test

### ** Examples

  # example in section 5 (page 546) of Vittinghoff et al. (2009).
  # minimum effect is = log(1.35) = 0.3001046
  minEffect.VSMc.poisson(n = 1239, power = 0.7998578, 
    sigma.m = sqrt(0.25 * (1 - 0.25)), 
    EY = 0.5, corr.xm = 0.5, 
    alpha = 0.05, verbose = TRUE)



