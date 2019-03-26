library(EMMIXmfa)


### Name: mcfa
### Title: Mixture of Common Factor Analyzers
### Aliases: mcfa mcfa.default mctfa mctfa.default
### Keywords: cluster multivariate models

### ** Examples

mcfa_fit <- mcfa(iris[, -5], g = 3, q = 3, itmax = 25,
                  nkmeans = 5, nrandom = 5, tol = 1.e-5)

plot(mcfa_fit)
## No test: 
mctfa_fit <- mcfa(iris[, -5], g = 3, q = 3, itmax = 500,
                  nkmeans = 5, nrandom = 5, tol = 1.e-5, df_update = TRUE)
## End(No test)



