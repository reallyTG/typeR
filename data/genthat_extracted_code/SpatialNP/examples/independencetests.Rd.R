library(SpatialNP)


### Name: Independence tests
### Title: Multivariate test of independence based on spatial signs or
###   ranks
### Aliases: sr.indep.test
### Keywords: multivariate nonparametric htest

### ** Examples

A<-matrix(c(1,2,-3,4,3,-2,-1,0,4),ncol=3)
X<-matrix(rnorm(3000),ncol=3)%*%t(A)
Y<-cbind(X+runif(3000,-1,1),runif(1000))
sr.indep.test(X,Y)
#alternative calls:
Z<-cbind(X,Y)
colnames(Z)<-c("a1","a2","a3","b1","b2","b3","b4")
g<-factor(c(rep(1,3),rep(2,4)))
sr.indep.test(Z,g=g)
sr.indep.test(Z,g=c("b"),regexp=TRUE)
sr.indep.test(Z,g=1:3)




