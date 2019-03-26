library(SpatialNP)


### Name: Spatial sign and rank covariance matrices
### Title: Spatial sign and rank covariance matrices
### Aliases: SCov SSCov RCov SRCov
### Keywords: multivariate nonparametric

### ** Examples

A<-matrix(c(1,2,-3,4,3,-2,-1,0,4),ncol=3)
X<-matrix(rt(150,1),ncol=3)%*%t(A) 
SCov(X) 
SSCov(X) 
RCov(X) 
SRCov(X)
to.shape(A%*%t(A),trace=1) 



