library(SpatialNP)


### Name: Spatial location
### Title: Multivariate location estimates based on spatial signs and
###   signed ranks
### Aliases: ae.hl.estimate ae.spatial.median spatial.location
### Keywords: multivariate nonparametric

### ** Examples

A<-matrix(c(1,2,-3,4,3,-2,-1,0,4),ncol=3)
X<-matrix(rnorm(3000),ncol=3)%*%t(A)
spatial.location(X,score="signrank")
spatial.location(X,score="sign")
#compare with:
colMeans(X)
ae.hl.estimate(X,shape=A%*%t(A))
ae.hl.estimate(X,shape=FALSE)



