library(powerSurvEpi)


### Name: ssizeEpi
### Title: Sample Size Calculation for Cox Proportional Hazards Regression
### Aliases: ssizeEpi
### Keywords: survival design

### ** Examples

  # generate a toy pilot data set
  X1 <- c(rep(1, 39), rep(0, 61))
  set.seed(123456)
  X2 <- sample(c(0, 1), 100, replace = TRUE)
  failureFlag <- sample(c(0, 1), 100, prob = c(0.5, 0.5), replace = TRUE)

  ssizeEpi(X1 = X1, X2 = X2, failureFlag = failureFlag, 
    power = 0.80, theta = 2, alpha = 0.05)



