library(copula)


### Name: plackettCopula
### Title: Construction of a Plackett Copula
### Aliases: plackettCopula
### Keywords: distribution multivariate

### ** Examples

plackett.cop <- plackettCopula(param=2)
lambda(plackett.cop) # 0 0 : no tail dependencies
## For really large param values (here, 1e20 and Inf are equivalent):
set.seed(1); Xe20 <- rCopula(5000, plackettCopula(1e20))
set.seed(1); Xinf <- rCopula(5000, plackettCopula(Inf))
stopifnot(all.equal(Xe20, Xinf))



