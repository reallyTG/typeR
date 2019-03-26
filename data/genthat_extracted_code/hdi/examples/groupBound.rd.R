library(hdi)


### Name: groupBound
### Title: Lower bound on the l1-norm of groups of regression variables
### Aliases: groupBound
### Keywords: confidence intervals regression

### ** Examples

## Create a regression problem with correlated design: p = 6, n = 50,
## block size B = 3 and within-block correlation of rho = 0.99
p   <- 6
n   <- 50
B   <- 3
rho <- 0.99

ind   <- rep(1:ceiling(p / B), each = B)[1:p]
Sigma <- diag(p)

for (ii in unique(ind)){
  id <- which(ind == ii)
  Sigma[id, id] <- rho
}
diag(Sigma) <- 1

x <- matrix(rnorm(n * p), nrow = n) %*% chol(Sigma)

## Create response with active variable 1
beta    <- rep(0, p)
beta[1] <- 5

y  <- as.numeric(x %*% beta + rnorm(n))

## Compute lower bounds:

## Lower bound for the L1-norm of *all* variables 1-6 of the sparsest
## optimal vector
nsplit <- 4  ## to make example run fast (use larger value)
lowerBoundAll <- groupBound(x, y, 1:p, nsplit = nsplit)
cat("\nlower bound for all variables 1-6: ", lowerBoundAll, "\n")

## Compute additional lower bounds:
## Lower bounds for variable 1 itself, then group {1,3}, 1-2, 1-3, 2-6,
lowerBound <- groupBound(x, y, list(1, c(1,3), 1:2, 1:3, 2:6),
                         nsplit = nsplit)
cat("lower bound for the groups\n\t {1}, {1,3}, {1,2}, {1..3}, {2..6}:\n\t",
    format(formatC(c(lowerBound))), "\n")



