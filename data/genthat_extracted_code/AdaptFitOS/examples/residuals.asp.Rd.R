library(AdaptFitOS)


### Name: residuals.asp
### Title: Residuals for semiparametric regression.
### Aliases: residuals.asp
### Keywords: models smooth regression

### ** Examples

data(fossil,package="SemiPar")
attach(fossil)
fit <- asp2(strontium.ratio~f(age))
plot(age,residuals(fit))
abline(0,0)



