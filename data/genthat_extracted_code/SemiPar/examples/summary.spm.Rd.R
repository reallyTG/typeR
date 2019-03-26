library(SemiPar)


### Name: summary.spm
### Title: Semiparametric regression summary
### Aliases: summary.spm
### Keywords: models smooth regression

### ** Examples

library(SemiPar)
data(onions)
attach(onions)
log.yield <- log(yield)
fit <- spm(log.yield~location+f(dens))
summary(fit)



