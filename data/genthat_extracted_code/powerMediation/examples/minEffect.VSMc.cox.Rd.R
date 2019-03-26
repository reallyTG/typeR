library(powerMediation)


### Name: minEffect.VSMc.cox
### Title: Minimum detectable slope for mediator in cox regression based on
###   Vittinghoff, Sen and McCulloch's (2009) method
### Aliases: minEffect.VSMc.cox
### Keywords: test

### ** Examples

  # example in section 6 (page 547) of Vittinghoff et al. (2009).
  # minimum effect is = log(1.5) = 0.4054651

  minEffect.VSMc.cox(n = 1399, power = 0.7999916, 
    sigma.m = sqrt(0.25 * (1 - 0.25)), psi = 0.2, corr.xm = 0.3, 
    alpha = 0.05, verbose = TRUE)




