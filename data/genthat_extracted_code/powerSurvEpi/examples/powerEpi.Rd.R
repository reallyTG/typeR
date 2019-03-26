library(powerSurvEpi)


### Name: powerEpi
### Title: Power Calculation for Cox Proportional Hazards Regression with
###   Two Covariates for Epidemiological Studies
### Aliases: powerEpi
### Keywords: survival design

### ** Examples

  # generate a toy pilot data set
  X1 <- c(rep(1, 39), rep(0, 61))
  set.seed(123456)
  X2 <- sample(c(0, 1), 100, replace = TRUE)
  failureFlag <- sample(c(0, 1), 100, prob = c(0.5, 0.5), replace = TRUE)

  powerEpi(X1 = X1, X2 = X2, failureFlag = failureFlag, 
    n = 139, theta = 2, alpha = 0.05)




