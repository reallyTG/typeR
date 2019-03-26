library(mgcv)


### Name: fixDependence
### Title: Detect linear dependencies of one matrix on another
### Aliases: fixDependence
### Keywords: models regression

### ** Examples

library(mgcv)
n<-20;c1<-4;c2<-7
X1<-matrix(runif(n*c1),n,c1)
X2<-matrix(runif(n*c2),n,c2)
X2[,3]<-X1[,2]+X2[,4]*.1
X2[,5]<-X1[,1]*.2+X1[,2]*.04
fixDependence(X1,X2)
fixDependence(X1,X2,strict=TRUE)



