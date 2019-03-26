library(powerMediation)


### Name: powerMediation.VSMc.cox
### Title: Power for testing mediation effect in cox regression based on
###   Vittinghoff, Sen and McCulloch's (2009) method
### Aliases: powerMediation.VSMc.cox
### Keywords: test

### ** Examples

  # example in section 6 (page 547) of Vittinghoff et al. (2009).
  # power = 0.7999916
  powerMediation.VSMc.cox(n = 1399, b2 = log(1.5), 
    sigma.m = sqrt(0.25 * (1 - 0.25)), psi = 0.2, corr.xm = 0.3,
    alpha = 0.05, verbose = TRUE)



