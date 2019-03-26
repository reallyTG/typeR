library(powerSurvEpi)


### Name: numDEpi.default
### Title: Calculate Number of Deaths Required for Cox Proportional Hazards
###   Regression with Two Covariates for Epidemiological Studies
### Aliases: numDEpi.default
### Keywords: survival design

### ** Examples

  # Example at the end of Section 5.2 of Latouche et al. (2004)
  # for a cohort study.
  D <- numDEpi.default(power = 0.8, theta = 2, p = 0.39, 
    rho2 = 0.132^2, alpha = 0.05)

  # proportion of subjects died of the disease of interest.
  psi <- 0.505

  # total number of subjects required to achieve the desired power
  ceiling(D / psi)




