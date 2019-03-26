library(matrixsampling)


### Name: rmatrixnormal
### Title: Matrix normal sampler
### Aliases: rmatrixnormal

### ** Examples

m <- 3
p <- 2
M <- matrix(1, m, p)
U <- toeplitz(m:1)
V <- toeplitz(p:1)
MNsims <- rmatrixnormal(10000, M, U, V)
dim(MNsims) # 3 2 10000
apply(MNsims, 1:2, mean) # approximates M
vecMNsims <- t(apply(MNsims, 3, function(X) c(t(X))))
round(cov(vecMNsims)) # approximates kronecker(U,V)



