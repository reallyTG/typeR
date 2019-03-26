library(tailDepFun)


### Name: stdfEmp
### Title: Empirical stable tail dependence function
### Aliases: stdfEmp

### ** Examples

## Simulate data from the Gumbel copula and compute the extremal coefficient in dimension four.
set.seed(2)
cop <- copula::gumbelCopula(param = 2, dim = 4)
data <- copula::rCopula(n = 1000, copula = cop)
stdfEmp(apply(data,2,rank), k = 50)



