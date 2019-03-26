library(lsei)


### Name: nnls
### Title: Least Squares and Quadratic Programming under Nonnegativity
###   Constraints
### Aliases: nnls pnnls pnnqp
### Keywords: array algebra

### ** Examples

a = matrix(rnorm(40), nrow=10)
b = drop(a %*% c(0,1,-1,1)) + rnorm(10)
nnls(a, b)$x                     # constraint x >= 0
pnnls(a, b, k=0)$x               # same as nnls(a, b)
pnnls(a, b, k=2)$x               # first two coeffs are not NN-constrained
pnnls(a, b, k=2, sum=1)$x        # NN-constrained coeffs must sum to 1
pnnls(a, b, k=2, sum=2)$x        # NN-constrained coeffs must sum to 2
q = crossprod(a)
p = -drop(crossprod(b, a))
pnnqp(q, p, k=2, sum=2)$x        # same solution

pnnls(a, b, sum=1)$x             # zeros found exactly
pnnqp(q, p, sum=1)$x             # zeros found exactly
lsei(a, b, rep(1,4), 1, lower=0) # zeros not so exact



