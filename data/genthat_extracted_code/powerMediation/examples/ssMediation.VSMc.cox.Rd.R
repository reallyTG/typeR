library(powerMediation)


### Name: ssMediation.VSMc.cox
### Title: Sample size for testing mediation effect in cox regression based
###   on Vittinghoff, Sen and McCulloch's (2009) method
### Aliases: ssMediation.VSMc.cox
### Keywords: test

### ** Examples

  # example in section 6 (page 547) of Vittinghoff et al. (2009).
  # n = 1399
  ssMediation.VSMc.cox(power = 0.7999916, b2 = log(1.5), 
    sigma.m = sqrt(0.25 * (1 - 0.25)), psi = 0.2, corr.xm = 0.3,
    alpha = 0.05, verbose = TRUE)




