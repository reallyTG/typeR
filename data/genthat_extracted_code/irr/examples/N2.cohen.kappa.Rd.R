library(irr)


### Name: N2.cohen.kappa
### Title: Sample Size Calculation for Cohen's Kappa Statistic with more
###   than one category
### Aliases: N2.cohen.kappa
### Keywords: misc

### ** Examples

  require(lpSolve)
  # Testing H0: kappa = 0.4 vs. HA: kappa > 0.4 (=0.6) given that
  # Marginal Probabilities by two raters are (0.2, 0.25, 0.55).
  #
  # one sided test with 80% power:
  N2.cohen.kappa(c(0.2, 0.25, 0.55), k1=0.6, k0=0.4)								
  # one sided test with 90% power:
  N2.cohen.kappa(c(0.2, 0.25, 0.55), k1=0.6, k0=0.4, power=0.9)	  

  # Marginal Probabilities by two raters are (0.2, 0.05, 0.2, 0.05, 0.2, 0.3)
  # Testing H0: kappa = 0.1 vs. HA: kappa > 0.1 (=0.5) given that
  #
  # one sided test with 80% power:
  N2.cohen.kappa(c(0.2, 0.05, 0.2, 0.05, 0.2, 0.3), k1=0.5, k0=0.1)				



