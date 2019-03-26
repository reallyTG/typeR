library(mar1s)


### Name: fit.mar1s
### Title: Fit Multiplicative AR(1) with Seasonal Process to Data
### Aliases: fit.mar1s
### Keywords: models multivariate ts

### ** Examples

data(forest.fire, package = "mar1s")
data(nesterov.index, package = "mar1s")

## Simple
mar1s <- fit.mar1s(forest.fire)
plot(mar1s$logseasonal)
confint(mar1s$logstoch.ar1)
mar1s$logresid.sd
resid <- nan2na(mar1s$decomposed$logresid)
qqnorm(resid)
qqline(resid)

## External regressors
mar1s <- fit.mar1s(forest.fire, nesterov.index[, "mean"])
plot(cbind(mar1s$logseasonal, mar1s$logseasonal.r))
confint(mar1s$logstoch.ar1)
resid <- nan2na(mar1s$decomposed$logresid)
qqnorm(resid)
qqline(resid)



