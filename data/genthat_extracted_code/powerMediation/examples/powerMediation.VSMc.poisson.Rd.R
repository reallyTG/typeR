library(powerMediation)


### Name: powerMediation.VSMc.poisson
### Title: Power for testing mediation effect in poisson regression based
###   on Vittinghoff, Sen and McCulloch's (2009) method
### Aliases: powerMediation.VSMc.poisson
### Keywords: test

### ** Examples

  # example in section 5 (page 546) of Vittinghoff et al. (2009).
  # power = 0.7998578
  powerMediation.VSMc.poisson(n = 1239, b2 = log(1.35), 
    sigma.m = sqrt(0.25 * (1 - 0.25)), EY = 0.5, corr.xm = 0.5,
    alpha = 0.05, verbose = TRUE)



