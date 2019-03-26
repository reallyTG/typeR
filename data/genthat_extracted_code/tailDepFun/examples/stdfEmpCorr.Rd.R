library(tailDepFun)


### Name: stdfEmpCorr
### Title: Bias-corrected empirical stable tail dependence function
### Aliases: stdfEmpCorr

### ** Examples

## Simulate data from the Gumbel copula
set.seed(2)
cop <- copula::gumbelCopula(param = 2, dim = 4)
data <- copula::rCopula(n = 1000, copula = cop)
stdfEmpCorr(apply(data,2,rank), k = 50)



