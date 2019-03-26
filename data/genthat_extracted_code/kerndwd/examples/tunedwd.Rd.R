library(kerndwd)


### Name: tunedwd
### Title: fast tune procedure for DWD
### Aliases: tunedwd

### ** Examples

set.seed(1)
data(BUPA)
BUPA$X = scale(BUPA$X, center=TRUE, scale=TRUE)
lambda = 10^(seq(-3, 3, length.out=10))
kern = rbfdot(sigma=sigest(BUPA$X))
ret = tunedwd(BUPA$X, BUPA$y, kern, qvals=c(1,2,10), lambda=lambda, eps=1e-5, maxit=1e5)
ret



