library(copula)


### Name: splom2-methods
### Title: Methods for Scatter Plot Matrix 'splom2' in Package 'copula'
### Aliases: splom2 splom2-methods splom2,matrix-method
###   splom2,data.frame-method splom2,Copula-method splom2,mvdc-method
### Keywords: hplot

### ** Examples

## For 'matrix' objects
## Create a 100 x 7 matrix of random variates from a t distribution
## with four degrees of freedom and plot the generated data
n <- 1000 # sample size
d <- 3 # dimension
nu <- 4 # degrees of freedom
tau <- 0.5 # Kendall's tau
th <- iTau(tCopula(df = nu), tau) # corresponding parameter
cop <- tCopula(th, dim = d, df = nu) # define copula object
set.seed(271)
U <- rCopula(n, copula = cop)
splom2(U)

## For 'copula' objects
set.seed(271)
splom2(cop, n = n) # same as above

## For 'rotCopula' objects: ---> Examples in rotCopula

## For 'mvdc' objects
mvNN <- mvdc(cop, c("norm", "norm", "exp"),
             list(list(mean = 0, sd = 1), list(mean = 1), list(rate = 2)))
splom2(mvNN, n = n)



