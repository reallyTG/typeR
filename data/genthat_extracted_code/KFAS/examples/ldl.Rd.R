library(KFAS)


### Name: ldl
### Title: LDL Decomposition of a Matrix
### Aliases: ldl

### ** Examples

# Positive semidefinite matrix, example matrix taken from ?chol
x <- matrix(c(1:5, (1:5)^2), 5, 2)
x <- cbind(x, x[, 1] + 3*x[, 2])
m <- crossprod(x)
l <- ldl(m)
d <- diag(diag(l))
diag(l) <- 1
all.equal(l %*% d %*% t(l), m, tol = 1e-15)



