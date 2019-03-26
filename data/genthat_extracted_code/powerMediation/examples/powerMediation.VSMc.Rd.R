library(powerMediation)


### Name: powerMediation.VSMc
### Title: Power for testing mediation effect in linear regression based on
###   Vittinghoff, Sen and McCulloch's (2009) method
### Aliases: powerMediation.VSMc
### Keywords: test

### ** Examples

  # example in section 3 (page 544) of Vittinghoff et al. (2009).
  # power=0.8
  powerMediation.VSMc(n = 863, b2 = 0.1, sigma.m = 1, sigma.e = 1, 
    corr.xm = 0.3, alpha = 0.05, verbose = TRUE)



