library(mixAK)


### Name: MatSqrt
### Title: Square root of a matrix
### Aliases: MatSqrt C_sqrtGE
### Keywords: array algebra

### ** Examples

MatSqrt(0:4)
MatSqrt((-4):0)
MatSqrt(c(-1, 1, -2, 2))

A <- (1:4) %*% t(1:4)
sqrtA <- MatSqrt(A)
sqrtA
round(sqrtA %*% sqrtA - A, 13)

### The following example crashes on r-devel Windows x64 x86_64,
### on r-patched Linux x86_64 
### due to failure of LAPACK zgesv routine
###
### Commented on 16/01/2010
###
# B <- -A
# sqrtB <- MatSqrt(B)
# sqrtB
# round(Re(sqrtB %*% sqrtB - B), 13)
# round(Im(sqrtB %*% sqrtB - B), 13)

V <- eigen(A)$vectors
sqrtV <- MatSqrt(V)
sqrtV
round(sqrtV %*% sqrtV - V, 14)

Sigma <- matrix(c(1, 1, 1.5,  1, 4, 4.2,  1.5, 4.2, 9), nrow=3)
sqrtSigma <- MatSqrt(Sigma)
sqrtSigma
round(sqrtSigma %*% sqrtSigma - Sigma, 13)

D4 <- matrix(c(5, -4,  1,  0,  0,
              -4,  6, -4,  1,  0,
               1, -4,  6, -4,  1,
               0,  1, -4,  6, -4,
               0,  0,  1, -4,  5), nrow=5)
sqrtD4 <- MatSqrt(D4)
sqrtD4[abs(sqrtD4) < 1e-15] <- 0
sqrtD4
round(sqrtD4 %*% sqrtD4 - D4, 14)

X <- matrix(c(7, 15, 10, 22), nrow=2)
sqrtX <- MatSqrt(X)
sqrtX %*% sqrtX - X



