library(pracma)


### Name: itersolve
### Title: Iterative Methods
### Aliases: itersolve
### Keywords: array

### ** Examples

N <- 10
A <- Diag(rep(3,N)) + Diag(rep(-2, N-1), k=-1) + Diag(rep(-1, N-1), k=1)
b <- A %*% rep(1, N)
x0 <- rep(0, N)

itersolve(A, b, tol = 1e-8, method = "Gauss-Seidel")
# [1]  1  1  1  1  1  1  1  1  1  1
# [1]  87
itersolve(A, b, x0 = 1:10, tol = 1e-8, method = "Jacobi")
# [1]  1  1  1  1  1  1  1  1  1  1
# [1]  177



