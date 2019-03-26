library(cmvnorm)


### Name: cmvnorm-package
### Title: The Complex Multivariate Gaussian Distribution
### Aliases: cmvnorm-package cmvnorm
### Keywords: package

### ** Examples



S1 <- 4+diag(5)
S2 <- S1
S2[1,5] <- 4+1i
S2[5,1] <- 4-1i   # Hermitian


rcmvnorm(10,sigma=S1)
rcmvnorm(10,mean=rep(1i,5),sigma=S2)

dcmvnorm(rep(1,5),sigma=S2)




