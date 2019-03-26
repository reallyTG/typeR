library(matrixsampling)


### Name: rmatrixit
### Title: Matrix inverted-t sampler
### Aliases: rmatrixit

### ** Examples

nu <- 0
m <- 2
p <- 3
M <- matrix(1, m, p)
U <- toeplitz(m:1)
V <- toeplitz(p:1)
ITsims <- rmatrixit(10000, nu, M, U, V)
dim(ITsims) # 2 3 10000
apply(ITsims, 1:2, mean) # approximates M
vecITsims <- t(apply(ITsims, 3, function(X) c(t(X))))
round(cov(vecITsims),2) # approximates 1/(nu+m+p-1) * kronecker(U,V)



