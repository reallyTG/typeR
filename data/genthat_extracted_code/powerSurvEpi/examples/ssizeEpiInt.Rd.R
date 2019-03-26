library(powerSurvEpi)


### Name: ssizeEpiInt
### Title: Sample Size Calculation Testing Interaction Effect for Cox
###   Proportional Hazards Regression
### Aliases: ssizeEpiInt
### Keywords: survival design

### ** Examples

  # generate a toy pilot data set
  X1 <- c(rep(1, 39), rep(0, 61))
  set.seed(123456)
  X2 <- sample(c(0, 1), 100, replace = TRUE)
  failureFlag <- sample(c(0, 1), 100, prob = c(0.25, 0.75), replace = TRUE)

  ssizeEpiInt(X1, X2, failureFlag, power = 0.88, theta = 3, alpha = 0.05)
  



