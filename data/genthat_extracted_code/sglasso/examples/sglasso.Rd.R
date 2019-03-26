library(sglasso)


### Name: sglasso
### Title: Lasso Method for the RCON(V, E) Models
### Aliases: sglasso print.sglasso
### Keywords: models graph multivariate

### ** Examples

########################################################
# sglasso solution path
#
## structural zeros:
## there are two ways to specify structural zeros which are 
## related to the kind of mask. If mask is a numeric matrix
## NA is used to identify the structural zero. If mask is a
## character matrix then the structural zeros are specified
## using NA or ".".
N <- 100
p <- 5
X <- matrix(rnorm(N * p), N, p)
S <- crossprod(X) / N
mask <- outer(1:p, 1:p, function(i,j) 0.5^abs(i-j))
mask[1,5] <- mask[1,4] <- mask[2,5] <- NA
mask[5,1] <- mask[4,1] <- mask[5,2] <- NA
mask

out.sglasso_path <- sglasso(S, mask, tol = 1.0e-13)
out.sglasso_path

rho <- out.sglasso_path$rho[20]
out.sglasso <- sglasso(S, mask, nrho = 1, min_rho = rho, tol = 1.0e-13, algorithm = "ccm")
out.sglasso

out.sglasso_path$theta[, 20]
out.sglasso$theta[, 1]



