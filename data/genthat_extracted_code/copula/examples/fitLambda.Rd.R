library(copula)


### Name: fitLambda
### Title: Non-parametric Estimators of the Matrix of Tail-Dependence
###   Coefficients
### Aliases: fitLambda
### Keywords: nonparametric multivariate

### ** Examples

n <- 10000 # sample size
p <- 0.01 # cut-off

## Bivariate case
d <- 2
cop <- claytonCopula(2, dim = d)
set.seed(271)
U <- rCopula(n, copula = cop) # generate observations (unrealistic)
(lam.true <- lambda(cop)) # true tail-dependence coefficients lambda
(lam.C <- c(lower = fitLambda(U, p = p)[2,1],
            upper = fitLambda(U, p = p, lower.tail = FALSE)[2,1])) # estimate lambdas
## => pretty good
U. <- pobs(U) # pseudo-observations (realistic)
(lam.C. <- c(lower = fitLambda(U., p = p)[2,1],
             upper = fitLambda(U., p = p, lower.tail = FALSE)[2,1])) # estimate lambdas
## => The pseudo-observations do have an effect...

## Higher-dimensional case
d <- 5
cop <- claytonCopula(2, dim = d)
set.seed(271)
U <- rCopula(n, copula = cop) # generate observations (unrealistic)
(lam.true <- lambda(cop)) # true tail-dependence coefficients lambda
(Lam.C <- list(lower = fitLambda(U, p = p),
               upper = fitLambda(U, p = p, lower.tail = FALSE))) # estimate Lambdas
## => Not too good
U. <- pobs(U) # pseudo-observations (realistic)
(Lam.C. <- list(lower = fitLambda(U., p = p),
                upper = fitLambda(U., p = p, lower.tail = FALSE))) # estimate Lambdas
## => Performance not too great here in either case



