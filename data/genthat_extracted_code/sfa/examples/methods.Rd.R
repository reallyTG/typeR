library(sfa)


### Name: methods.sfa
### Title: Methods for displaying information about stochastic frontier
###   analysis models
### Aliases: methods.sfa coef.sfa print.sfa predict.sfa fitted.sfa
###   logLik.sfa residuals.sfa summary.sfa print.summary.sfa eff.sfa
### Keywords: methods

### ** Examples

set.seed(225)
daten <- dgp(n = 100, b = c(1, 2), sc = -1)
test <- sfa(y ~ x, data = daten)
coef(test)
print(test)
predict(test)
fitted(test)
logLik(test)
residuals(test)
summary(test)
eff(test)



