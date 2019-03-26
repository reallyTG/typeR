library(parcor)


### Name: pls.net
### Title: Partial Correlations with Partial Least Squares
### Aliases: pls.net
### Keywords: multivariate

### ** Examples

n<-20
p<-40
X<-matrix(rnorm(n*p),ncol=p)
pc<-pls.net(X,ncomp=10,k=5)



