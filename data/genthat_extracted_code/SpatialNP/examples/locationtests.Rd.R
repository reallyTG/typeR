library(SpatialNP)


### Name: Location tests
### Title: Spatial sign and rank tests of multivariate location
### Aliases: sr.loc.test
### Keywords: multivariate nonparametric htest

### ** Examples

A<-matrix(c(1,2,-3,4,3,-2,-1,0,4),ncol=3)
X<-rbind(matrix(rnorm(1500),ncol=3),matrix(rnorm(750)+1,ncol=3))%*%t(A)
sr.loc.test(X,cond=TRUE)
X[1:250,]<-X[1:250,]+1
g<-factor(rep(c(1,2,3),each=250))
sr.loc.test(X,g=g,score="rank")



