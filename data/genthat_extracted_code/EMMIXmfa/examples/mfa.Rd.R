library(EMMIXmfa)


### Name: mfa
### Title: Mixtures of Factor Analyzers
### Aliases: mfa mfa.default plot.mfa mtfa mtfa.default plot.mtfa
### Keywords: cluster multivariate models

### ** Examples

model <- mfa(iris[, -5], g=3, q=2, itmax=200, nkmeans=1, nrandom=5)
summary(model)
## No test: 
model <- mtfa(iris[, -5], g=3, q=2, itmax=200, nkmeans=1, nrandom=5)
## End(No test)  



