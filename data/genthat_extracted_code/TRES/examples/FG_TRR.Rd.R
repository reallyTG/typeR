library(TRES)


### Name: FG_TRR
### Title: Envelope estimation of tensor response regression with the full
###   Grassmannian optimization
### Aliases: FG_TRR

### ** Examples

rm(list=ls())

r <- c(10, 10, 10)
m <- length(r)
u <- c(2, 2, 2)
p <- 5
n <- 100


set.seed(1)
eta <- array(runif(prod(u)*p), c(u, p))
eta <- as.tensor(eta)

Gamma <- Gamma0 <- Omega <- Omega0 <- Sig <- Sigsqrtm <- NULL
for (i in 1:m){
  tmp <- matrix(runif(r[i]*u[i]), r[i], u[i])
  Gamma[[i]] <- qr.Q(qr(tmp))
  Gamma0[[i]] <- qr.Q(qr(Gamma[[i]]),complete=TRUE)[,(u[i]+1):r[i]]

  A <- matrix(runif(u[i]^2), u[i], u[i])
  Omega[[i]] <- A %*% t(A)
  A <- matrix(runif((r[i]-u[i])^2), (r[i]-u[i]), (r[i]-u[i]))
  Omega0[[i]] <- A %*% t(A)
  Sig[[i]] <- Gamma[[i]] %*% Omega[[i]] %*% t(Gamma[[i]])+
    Gamma0[[i]] %*% Omega0[[i]] %*% t(Gamma0[[i]])
  Sig[[i]] <- 10*Sig[[i]]/norm(Sig[[i]], type="F")+0.01*diag(r[i])
  Sigsqrtm[[i]] <- pracma::sqrtm(Sig[[i]])$B
}
B <- ttl(eta, Gamma, ms=1:m)
Xn <- matrix(rnorm(p*n), p, n)
Xn_inv <- MASS::ginv(Xn %*% t(Xn)) %*% Xn
Epsilon <- array(rnorm(prod(r)*n), c(r, n))
Epsilon <- as.tensor(Epsilon)
Epsilon <- ttl(Epsilon, Sigsqrtm, ms=1:m)
Yn <- Epsilon + ttm(B, t(Xn), m+1)


res_1D = TRR(Yn, Xn, u, method="1D")
res_FG = FG_TRR(Yn, Xn, Gamma_init=res_1D$Gamma_hat)

rTensor::fnorm(B-res_1D$Bhat)
rTensor::fnorm(B-res_FG$Bhat)



