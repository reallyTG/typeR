library(SpatialNP)


### Name: mvhuberM
### Title: Multivariate Huber's M-estimator and its symmetrized version
### Aliases: mvhuberM symmhuber
### Keywords: multivariate robust

### ** Examples

A<-matrix(c(1,2,-3,4,3,-2,-1,0,4),ncol=3)
X<-matrix(rnorm(1500),ncol=3)%*%t(A)
mvhuberM(X)
symmhuber(X)



