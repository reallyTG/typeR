library(powerMediation)


### Name: minEffect.VSMc
### Title: Minimum detectable slope for mediator in linear regression based
###   on Vittinghoff, Sen and McCulloch's (2009) method
### Aliases: minEffect.VSMc
### Keywords: test

### ** Examples

  # example in section 3 (page 544) of Vittinghoff et al. (2009).
  # minimum effect is =0.1
  minEffect.VSMc(n = 863, power = 0.8, sigma.m = 1, 
    sigma.e = 1, corr.xm = 0.3, alpha = 0.05, verbose = TRUE)



