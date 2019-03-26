library(AdaptFitOS)


### Name: fitted.asp
### Title: Fitted values for semiparametric regression.
### Aliases: fitted.asp
### Keywords: models smooth regression

### ** Examples

data(fossil,package="SemiPar")
attach(fossil)
fit <- asp2(strontium.ratio~f(age))
plot(fit, bands=FALSE)
points(age,fitted(fit)-fit$coef[1],col="red")



