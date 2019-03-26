library(plaqr)


### Name: threshold
### Title: Classifying a Numerical Response Using a Threshold
### Aliases: threshold

### ** Examples

data(simData)
fit <- plaqr(y~.,~z1+z2,data=simData)
testdata <- .5*simData[4,2:6]
trh <- threshold(fit, t=9, newdata=testdata)
trh$pred.class
trh



