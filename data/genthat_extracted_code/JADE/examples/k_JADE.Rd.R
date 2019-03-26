library(JADE)


### Name: k_JADE
### Title: Fast Equivariant k-JADE Algorithm for ICA
### Aliases: k_JADE
### Keywords: multivariate

### ** Examples

# 3 source and 3 signals

S <- cbind(rt(1000, 4), rnorm(1000), runif(1000))
A <- matrix(rnorm(9), ncol = 3)
X <- S %*% t(A)
res_k1<-k_JADE(X,1)
res_k1$A
res_k1$W
res_k1$S[1:10,]

MD(coef(res_k1),A) 




