library(copula)


### Name: cloud2-methods
### Title: Cloud Plot Methods ('cloud2') in Package 'copula'
### Aliases: cloud2 cloud2-methods cloud2,matrix-method
###   cloud2,data.frame-method cloud2,Copula-method cloud2,mvdc-method
### Keywords: methods hplot

### ** Examples

## For 'matrix' objects
cop <- gumbelCopula(2, dim = 3)
n <- 1000
set.seed(271)
U <- rCopula(n, copula = cop)
cloud2(U, xlab = quote(U[1]), ylab = quote(U[2]), zlab = quote(U[3]))

## For 'Copula' objects
set.seed(271)
cloud2(cop, n = n) # same as above

## For 'mvdc' objects
mvNN <- mvdc(cop, c("norm", "norm", "exp"),
             list(list(mean = 0, sd = 1), list(mean = 1), list(rate = 2)))
cloud2(mvNN, n = n)



