library(GHS)


### Name: GHS_est
### Title: GHS MCMC sampler using data-augmented block (column-wise) Gibbs
###   sampler
### Aliases: GHS_est

### ** Examples

# This function generates positive definite matrices for testing purposes 
# with specificied eigenvalues
Posdef <- function (n,ev)
{
  Z <- matrix(ncol=n, rnorm(n^2))
  decomp <- qr(Z)
  Q <- qr.Q(decomp)
  R <- qr.R(decomp)
  d <- diag(R)
  ph <- d / abs(d)
  O <- Q %*% diag(ph)
  Z <- t(O) %*% diag(ev) %*% O
  return(Z)
}
eig1 <- rep(1,2)
eig2 <- rep(0.75,3)
#eig3 <- rep(0.25,3)
eig_val <- c(eig1,eig2)
z <- Posdef(5,eig_val)
Mu <- rep(0,5)
Sigma <- solve(z)
Y <- mvrnorm(n=5,mu=Mu,Sigma=Sigma)
S <- t(Y)%*%Y
out <- GHS_est(S,50,100,5000)
est_matrix <- apply(out[[1]],c(1,2),mean)
image(est_matrix)



