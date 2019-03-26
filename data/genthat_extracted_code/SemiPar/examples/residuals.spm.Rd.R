library(SemiPar)


### Name: residuals.spm
### Title: Residuals for semiparametric regression.
### Aliases: residuals.spm
### Keywords: models smooth regression

### ** Examples

library(SemiPar)
data(fossil)
attach(fossil)
fit <- spm(strontium.ratio~f(age))
plot(age,residuals(fit))
abline(0,0)



