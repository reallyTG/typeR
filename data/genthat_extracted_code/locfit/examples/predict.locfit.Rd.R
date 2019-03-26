library(locfit)


### Name: predict.locfit
### Title: Prediction from a Locfit object.
### Aliases: predict.locfit
### Keywords: smooth

### ** Examples

data(ethanol, package="locfit")
fit <- locfit(NOx ~ E, data=ethanol)
predict(fit,c(0.6,0.8,1.0))



