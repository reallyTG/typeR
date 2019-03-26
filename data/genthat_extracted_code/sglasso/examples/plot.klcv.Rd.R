library(sglasso)


### Name: plot.klcv
### Title: Plot Method for Leave-One-Out Cross-Validated Kullback-Leibler
###   Divergence
### Aliases: plot.klcv
### Keywords: models

### ** Examples

N <- 100
p <- 5
X <- matrix(rnorm(N * p), N, p)
S <- crossprod(X) / N
mask <- outer(1:p, 1:p, function(i,j) 0.5^abs(i-j))
mask[1,5] <- mask[1,4] <- mask[2,5] <- NA
mask[5,1] <- mask[4,1] <- mask[5,2] <- NA
out.sglasso_path <- sglasso(S, mask, tol = 1.0e-13)
out.klcv <- klcv(out.sglasso_path, X)
plot(out.klcv)



