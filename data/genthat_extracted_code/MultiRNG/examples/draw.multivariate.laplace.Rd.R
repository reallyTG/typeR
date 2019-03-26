library(MultiRNG)


### Name: draw.multivariate.laplace
### Title: Pseudo-Random Number Generation under Multivariate Laplace
###   Distribution
### Aliases: draw.multivariate.laplace

### ** Examples

cmat<-matrix(c(1,0.2,0.3,0.2,1,0.2,0.3,0.2,1), nrow=3, ncol=3)
mu.vec=c(0,3,7)
mydata=draw.multivariate.laplace(no.row=1e5,d=3,gamma=2,mu=mu.vec,Sigma=cmat)
## No test: 
apply(mydata,2,mean)-mu.vec
cor(mydata)-cmat
## End(No test)



