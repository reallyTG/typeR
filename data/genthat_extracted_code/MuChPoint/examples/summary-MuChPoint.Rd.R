library(MuChPoint)


### Name: summary,MuChPoint-method
### Title: Summary of a 'MuChPoint' object.
### Aliases: summary,MuChPoint-method

### ** Examples

require(MuChPoint)
mu=c(rep(c(rep(1,25),rep(0,25)),3))%*%t(rep(c(rep(0,25),rep(1,25)),3))
Y=matrix(rnorm(150^2,0,2),150)+mu+t(mu)
Y=as.matrix(Matrix::forceSymmetric(Y))
res=MuChPoint(Y)
summary(res)




