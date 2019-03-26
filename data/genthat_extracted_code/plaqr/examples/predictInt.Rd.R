library(plaqr)


### Name: predictInt
### Title: Prediction Inteval for Quantile Regression
### Aliases: predictInt

### ** Examples

data(simData)
fit <- plaqr(y~.,~z1+z2,data=simData)
predictInt(fit, level=.95)



