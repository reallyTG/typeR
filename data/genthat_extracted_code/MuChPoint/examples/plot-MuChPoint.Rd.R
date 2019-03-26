library(MuChPoint)


### Name: plot,MuChPoint-method
### Title: Produce a plot of two-dimensional segmentation of a 'MuChPoint'
###   fit.
### Aliases: plot,MuChPoint-method

### ** Examples

require(MuChPoint)
mu=c(rep(c(rep(1,25),rep(0,25)),3))%*%t(rep(c(rep(0,25),rep(1,25)),3))
Y=matrix(rnorm(150^2,0,2),150)+mu+t(mu)
Y=as.matrix(Matrix::forceSymmetric(Y))
res=MuChPoint(Y)
plot(res,Y,L=5,shiny=FALSE)
plot(res,Y,L=1:5,shiny=FALSE,ask=FALSE)




