library(SpatialNP)


### Name: Shape matrices
### Title: Shape matrices based on spatial ranks and signed ranks
### Aliases: rank.shape signs.shape signrank.shape spatial.shape
###   symmsign.shape symmhuber.shape
### Keywords: multivariate nonparametric htest

### ** Examples

A<-matrix(c(1,2,-3,4,3,-2,-1,0,4),ncol=3)
X<-matrix(rnorm(1500),ncol=3)%*%t(A)
symmsign.shape(X)
to.shape(symmsign.shape(X),trace=3)
spatial.shape(X,score="sign")
spatial.shape(X,score="sign",fixed.loc=TRUE)
to.shape(A%*%t(A))
# one-step shape estimate based on spatial ranks and covariance matrix:
spatial.shape(X,score="rank",init=cov(X),steps=1)



