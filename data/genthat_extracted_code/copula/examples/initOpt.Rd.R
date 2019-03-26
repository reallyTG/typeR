library(copula)


### Name: initOpt
### Title: Initial Interval or Value for Parameter Estimation of
###   Archimedean Copulas
### Aliases: initOpt

### ** Examples

## Definition of the function:
initOpt

## Generate some data:
tau <- 0.25
(theta <- copGumbel@iTau(tau)) # 4/3
d <- 20
(cop <- onacopulaL("Gumbel", list(theta,1:d)))

set.seed(1)
n <- 200
U <- rnacopula(n, cop)

## Initial interval:
initOpt("Gumbel") # contains theta

## Initial values:
initOpt("Gumbel", interval=FALSE, u=U) # 1.3195
initOpt("Gumbel", interval=FALSE, u=U, method="tau.mean") # 1.2844



