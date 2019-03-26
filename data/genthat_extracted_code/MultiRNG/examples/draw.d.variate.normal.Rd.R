library(MultiRNG)


### Name: draw.d.variate.normal
### Title: Pseudo-Random Number Generation under Multivariate Normal
###   Distribution
### Aliases: draw.d.variate.normal

### ** Examples

cmat<-matrix(c(1,0.2,0.3,0.2,1,0.2,0.3,0.2,1), nrow=3, ncol=3)
meanvec=c(0,3,7)
mydata=draw.d.variate.normal(no.row=1e5,d=3,mean.vec=meanvec,cov.mat=cmat)
apply(mydata,2,mean)-meanvec
cor(mydata)-cmat



