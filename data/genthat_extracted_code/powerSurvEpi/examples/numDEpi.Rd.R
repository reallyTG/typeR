library(powerSurvEpi)


### Name: numDEpi
### Title: Calculate Number of Deaths Required for Cox Proportional Hazards
###   Regression with Two Covariates for Epidemiological Studies
### Aliases: numDEpi
### Keywords: survival design

### ** Examples

  # generate a toy pilot data set
  X1 <- c(rep(1, 39), rep(0, 61))
  set.seed(123456)
  X2 <- sample(c(0, 1), 100, replace = TRUE)
  res <- numDEpi(X1, X2, power = 0.8, theta = 2, alpha = 0.05)
  print(res)

  # proportion of subjects died of the disease of interest.
  psi <- 0.505

  # total number of subjects required to achieve the desired power
  ceiling(res$D / psi)




