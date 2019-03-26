library(powerSurvEpi)


### Name: ssizeEpiCont
### Title: Sample Size Calculation for Cox Proportional Hazards Regression
###   with Nonbinary Covariates for Epidemiological Studies
### Aliases: ssizeEpiCont
### Keywords: survival design

### ** Examples

  # generate a toy pilot data set
  set.seed(123456)
  X1 <- rnorm(100, mean = 0, sd = 0.3126)
  X2 <- sample(c(0, 1), 100, replace = TRUE)
  failureFlag <- sample(c(0, 1), 100, prob = c(0.25, 0.75), replace = TRUE)
  dat <- data.frame(X1 = X1, X2 = X2, failureFlag = failureFlag)

  ssizeEpiCont(formula = X1 ~ X2, dat = dat, X1 = X1, failureFlag = failureFlag, 
    power = 0.806, theta = exp(1), alpha = 0.05)




