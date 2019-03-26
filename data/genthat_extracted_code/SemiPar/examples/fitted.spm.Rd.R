library(SemiPar)


### Name: fitted.spm
### Title: Fitted values for semiparametric regression.
### Aliases: fitted.spm
### Keywords: models smooth regression

### ** Examples

library(SemiPar)
data(fossil)
attach(fossil)
fit <- spm(strontium.ratio~f(age))
plot(fit)
points(age,fitted(fit),col="red")



