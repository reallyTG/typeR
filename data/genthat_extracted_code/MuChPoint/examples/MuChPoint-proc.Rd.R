library(MuChPoint)


### Name: MuChPoint
### Title: MuChPoint fitting procedure
### Aliases: MuChPoint

### ** Examples

require(MuChPoint)
mu=c(rep(c(rep(1,25),rep(0,25)),3))%*%t(rep(c(rep(0,25),rep(1,25)),3))
Y=matrix(rnorm(150^2,0,5),150)+mu+t(mu)
Y=as.matrix(Matrix::forceSymmetric(Y))
res=MuChPoint(Y)
plot(res,Y,L=5,shiny=FALSE)
plot(res,Y,L=1:5,shiny=FALSE,ask=FALSE)





