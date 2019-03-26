library(parcor)


### Name: ridge.net
### Title: Partial correlations with ridge regression.
### Aliases: ridge.net
### Keywords: multivariate

### ** Examples

n<-20
p<-40
X<-matrix(rnorm(n*p),ncol=p)
pc<-ridge.net(X,k=5)



