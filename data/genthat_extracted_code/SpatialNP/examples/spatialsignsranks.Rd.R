library(SpatialNP)


### Name: Spatial signs, symmetrized signs, ranks and signed ranks
### Title: Spatial signs, symmetrized signs, ranks and signed ranks
### Aliases: spatial.signs spatial.rank spatial.symmsign spatial.signrank
### Keywords: multivariate nonparametric

### ** Examples

A<-matrix(c(1,2,-3,4),ncol=2)
X<-matrix(rnorm(100),ncol=2)%*%t(A)
def.par<-par(no.readonly=TRUE) # for resetting
layout(matrix(1:4,ncol=2,nrow=2,byrow=TRUE))
plot(X,col=c(2,rep(1,19)))
plot(spatial.symmsign(X),col=c(2,rep(1,19)),xlim=c(-1,1),ylim=c(-1,1))
theta<-seq(0,2*pi,length=1000)
lines(sin(theta),cos(theta))
plot(spatial.rank(X),col=c(2,rep(1,19)),xlim=c(-1,1),ylim=c(-1,1))
lines(sin(theta),cos(theta))
plot(spatial.signrank(X),col=c(2,rep(1,19)),xlim=c(-1,1),ylim=c(-1,1))
lines(sin(theta),cos(theta))
par(def.par)



