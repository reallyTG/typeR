library(powerSurvEpi)


### Name: powerEpiCont.default
### Title: Power Calculation for Cox Proportional Hazards Regression with
###   Nonbinary Covariates for Epidemiological Studies
### Aliases: powerEpiCont.default
### Keywords: survival design

### ** Examples

  # example in the EXAMPLE section (page 557) of Hsieh and Lavori (2000).
  # Hsieh and Lavori (2000) assumed one-sided test, 
  # while this implementation assumed two-sided test. 
  # Hence alpha=0.1 here (two-sided test) will correspond
  # to alpha=0.05 of one-sided test in Hsieh and Lavori's (2000) example.
  powerEpiCont.default(n = 107, theta = exp(1), sigma2 = 0.3126^2, 
    psi = 0.738, rho2 = 0.1837, alpha = 0.1)




