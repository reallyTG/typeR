library(SpatialNP)


### Name: Sphericity tests
### Title: Sphericity tests
### Aliases: sr.sphere.test
### Keywords: multivariate nonparametric htest

### ** Examples

A<-matrix(c(1,2,-3,4,3,-2,-1,0,4),ncol=3)
X<-matrix(rnorm(600),ncol=3)%*%t(A)
sr.sphere.test(X,score="sign")



