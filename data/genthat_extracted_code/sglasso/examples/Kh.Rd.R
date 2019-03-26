library(sglasso)


### Name: Kh
### Title: Extract Sparse Structured Precision Matrices
### Aliases: Kh
### Keywords: models

### ** Examples

N <- 100
p <- 5
X <- matrix(rnorm(N * p), N, p)
S <- crossprod(X) / N
mask <- outer(1:p, 1:p, function(i, j) 0.5^abs(i - j))
out.sglasso_path <- sglasso(S, mask, nrho = 5, tol = 1.0e-13)
out.sglasso_path
Kh(out.sglasso_path)
rho <- out.sglasso_path$rho[3]
out.sglasso_single <- sglasso(S, mask, nrho = 1, min_rho = rho, 
   tol = 1.0e-13, algorithm = "ccm")
Kh(out.sglasso_single)



