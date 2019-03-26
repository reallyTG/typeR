library(powerSurvEpi)


### Name: powerEpiInt2
### Title: Power Calculation Testing Interaction Effect for Cox
###   Proportional Hazards Regression
### Aliases: powerEpiInt2
### Keywords: survival design

### ** Examples

  # Example at the end of Section 4 of Schmoor et al. (2000).
  # mya, myb, myc, and myd are obtained from Table III on page 448
  # of Schmoor et al. (2000).
  powerEpiInt2(n = 184, theta = 3, psi = 139 / 184,
    mya = 50, myb = 21, myc = 78, myd = 35, alpha = 0.05)
  



