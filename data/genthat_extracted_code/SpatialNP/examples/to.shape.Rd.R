library(SpatialNP)


### Name: to.shape
### Title: Rescale a matrix to a shape matrix
### Aliases: to.shape
### Keywords: multivariate

### ** Examples

(A<-matrix(c(1,2,-3,4,3,-2,-1,0,4),ncol=3))
to.shape(A%*%t(A))
to.shape(A%*%t(A),trace=3)
to.shape(A%*%t(A),first=1)




