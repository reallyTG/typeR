library(TRES)


### Name: TPR
### Title: Tensor Predictor Regression
### Aliases: TPR

### ** Examples


rm(list = ls())

p <- c(10, 10, 10)
u <- c(1, 1, 1)
m <- 3; r <- 5; n <- 200
eta <- array(runif(prod(u,r)), c(u,r))
eta <- as.tensor(eta)

Gamma <- Gamma0 <- Omega <- Omega0 <- Sig <- Sigsqrtm <- NULL
for(i in 1:m) {
  tmp <- matrix(runif(p[i]*u[i]), p[i], u[i])
  Gamma[[i]] <- qr.Q(qr(tmp))
  Gamma0[[i]] <- qr.Q(qr(tmp), complete=TRUE)[, (u[i]+1):p[i]]
  Omega[[i]] <- diag(u[i])
  Omega0[[i]] <- 0.01*diag(p[i]-u[i])
  Sig[[i]] <- Gamma[[i]] %*% Omega[[i]] %*% t(Gamma[[i]])+
    Gamma0[[i]] %*% Omega0[[i]] %*% t(Gamma0[[i]])
  Sig[[i]] <- 2*Sig[[i]]/norm(Sig[[i]], type="F")
  Sigsqrtm[[i]] <- pracma::sqrtm(Sig[[i]])$B
}

B <- ttl(eta,Gamma, ms = c(1:m))
A <- matrix(runif(r^2), r, r)
SigY <- A %*% t(A)
SigY <- SigY/norm(SigY, type="F")


##generate data
Epsilon <- MASS::mvrnorm(n, mu=rep(0, r), Sigma=SigY)
tmp2 <- array(rnorm(prod(p, n)), c(p, n))
Xn <- as.tensor(tmp2)
Xn <- ttl(Xn, Sigsqrtm, ms = c(1:m))
vecXn <- matrix(Xn@data, prod(p), n)
Y_tmp <- matrix(NA, r, 200)
tmp <- array(NA, c(p, r))
for (j in 1:n) {
  for (s in 1:r) {
    tmp[, , , s] <-  B@data[, , , s]*Xn@data[, , , j]
  }
  Y_tmp[, j] <- apply(tmp, 4, sum)
}
Yn <-  Y_tmp + t(Epsilon)


res_ECD = TPR(Yn, Xn, u, method="ECD")
res_1D = TPR(Yn, Xn, u, method="1D")
res_pls = TPR(Yn, Xn, u, method="PLS")
res_std = TPR(Yn, Xn, u, method="standard")

rTensor::fnorm(B-res_ECD$Bhat)
rTensor::fnorm(B-res_1D$Bhat)
rTensor::fnorm(B-res_pls$Bhat)
rTensor::fnorm(B-res_std$Bhat)



