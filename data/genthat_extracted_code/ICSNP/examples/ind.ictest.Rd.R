library(ICSNP)


### Name: ind.ictest
### Title: Test of Independence based on Marginal Ranks in a Symmetric IC
###   Model
### Aliases: ind.ictest
### Keywords: htest multivariate nonparametric

### ** Examples

Z1<-cbind(rt(500,5),rnorm(500),runif(500))
Z2<-cbind(rt(500,8),rbeta(500,2,2))
A1 <- matrix(c(4, 4, 5, 4, 6, 6, 5, 6, 7), ncol = 3)
A2 <- matrix(c(0.5, -0.3, -0.3, 0.7), ncol = 2)

X <- cbind(Z1 %*% t(A1), Z2 %*% t(A2))

ind.ictest(X,1:3)
ind.ictest(X,1:3,method="simu")

ind.ictest(X,1:2,3:5,method="perm", S1=tyler.shape,S2=cov)




