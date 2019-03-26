library(excursions)


### Name: excursions.variances
### Title: Calculate variances from a sparse precision matrix
### Aliases: excursions.variances

### ** Examples

## Create a tridiagonal precision matrix
n = 21
Q = Matrix(toeplitz(c(1, -0.1, rep(0, n-2))))
v2 = excursions.variances(Q=Q,max.threads=2)
## var2 should be the same as:
v1 = diag(solve(Q))



