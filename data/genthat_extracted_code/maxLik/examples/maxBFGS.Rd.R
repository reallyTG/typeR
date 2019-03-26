library(maxLik)


### Name: maxBFGS
### Title: BFGS, conjugate gradient, SANN and Nelder-Mead Maximization
### Aliases: maxBFGS maxCG maxSANN maxNM
### Keywords: optimize

### ** Examples

# Maximum Likelihood estimation of Poissonian distribution
n <- rpois(100, 3)
loglik <- function(l) n*log(l) - l - lfactorial(n)
# we use numeric gradient
summary(maxBFGS(loglik, start=1))
# you would probably prefer mean(n) instead of that ;-)
# Note also that maxLik is better suited for Maximum Likelihood
###
### Now an example of constrained optimization
###
f <- function(theta) {
  x <- theta[1]
  y <- theta[2]
  exp(-(x^2 + y^2))
  ## you may want to use exp(- theta %*% theta) instead
}
## use constraints: x + y >= 1
A <- matrix(c(1, 1), 1, 2)
B <- -1
res <- maxNM(f, start=c(1,1), constraints=list(ineqA=A, ineqB=B),
control=list(printLevel=1))
print(summary(res))



