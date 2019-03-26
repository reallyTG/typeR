library(orthoDr)


### Name: ortho_optim
### Title: Orthogonality constrained optimization
### Aliases: ortho_optim

### ** Examples

# an eigen value problem
library(pracma)
set.seed(1)
n = 100; k = 6
A = matrix(rnorm(n*n), n, n)
A = t(A) %*% A
B = gramSchmidt(matrix(rnorm(n*k), n, k))$Q
fx <- function(B, A) -0.5 * sum(diag(t(B) %*% A %*% B ))
gx <- function(B, A) -A %*% B
fit = ortho_optim(B, fx, gx, A = A)
fx(fit$B, A)

# compare with the solution from the eigen function
sol = eigen(A)$vectors[, 1:k]
fx(sol, A)



