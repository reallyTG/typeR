library(powerSurvEpi)


### Name: powerEpiInt.default1
### Title: Power Calculation Testing Interaction Effect for Cox
###   Proportional Hazards Regression
### Aliases: powerEpiInt.default1
### Keywords: survival design

### ** Examples

  # Example at the end of Section 4 of Schmoor et al. (2000).
  # p00, p01, p10, and p11 are calculated based on Table III on page 448
  # of Schmoor et al. (2000).
  powerEpiInt.default1(n = 184, theta = 3, psi = 139 / 184,
    p00 = 50 / 184, p01 = 21 / 184, p10 = 78 / 184, p11 = 35 / 184,
    alpha = 0.05)
  



