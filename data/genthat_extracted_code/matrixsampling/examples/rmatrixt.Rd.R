library(matrixsampling)


### Name: rmatrixt
### Title: Matrix t sampler
### Aliases: rmatrixt

### ** Examples

nu <- 4
m <- 2
p <- 3
M <- matrix(1, m, p)
U <- toeplitz(m:1)
V <- toeplitz(p:1)
Tsims <- rmatrixt(10000, nu, M, U, V)
dim(Tsims) # 2 3 10000
apply(Tsims, 1:2, mean) # approximates M
vecTsims <- t(apply(Tsims, 3, function(X) c(t(X))))
round(cov(vecTsims), 1) # approximates 1/(nu-2) * kronecker(U,V)
## the `keep` class is nice when m=1 or p=1:
Tsims <- rmatrixt(2, nu, M=1:3, U=diag(3), V=1)
Tsims[,,1] # dimensions 3 1
# without `keep`, dimensions are lost:
rmatrixt(2, nu, M=1:3, U=diag(3), V=1, keep=FALSE)[,,1]



