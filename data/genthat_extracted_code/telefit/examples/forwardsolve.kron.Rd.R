library(telefit)


### Name: forwardsolve.kron
### Title: Solves a triangular system with a Kronecker product structure
### Aliases: forwardsolve.kron

### ** Examples

set.seed(2018)

coord.s = matrix(runif(100), ncol=2)
coord.r = matrix(runif(50), ncol=2)

d.s = as.matrix(dist(coord.s))
d.r = as.matrix(dist(coord.r))

S1 = exp(-d.s)
S2 = exp(-d.r)

A = t(chol(S1))
B = t(chol(S2))

x = runif(nrow(S1)*nrow(S2))

y = kronecker(A,B) %*% x

x.solved = forwardsolve.kron(A, B, y)

max(abs(x - x.solved))



