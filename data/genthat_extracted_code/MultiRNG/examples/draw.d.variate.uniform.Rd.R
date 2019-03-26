library(MultiRNG)


### Name: draw.d.variate.uniform
### Title: Pseudo-Random Number Generation under Multivariate Uniform
###   Distribution
### Aliases: draw.d.variate.uniform

### ** Examples

cmat<-matrix(c(1,0.2,0.3,0.2,1,0.2,0.3,0.2,1), nrow=3, ncol=3)
mydata=draw.d.variate.uniform(no.row=1e5,d=3,cov.mat=cmat)
apply(mydata,2,mean)-rep(0.5,3)
cor(mydata)-cmat



