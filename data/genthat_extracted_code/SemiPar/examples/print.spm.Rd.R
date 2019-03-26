library(SemiPar)


### Name: print.spm
### Title: Prints semiparametric regression fit object.
### Aliases: print.spm
### Keywords: models smooth regression

### ** Examples

library(SemiPar)
data(fossil)
attach(fossil)
fit <- spm(strontium.ratio~f(age))
print(fit)



