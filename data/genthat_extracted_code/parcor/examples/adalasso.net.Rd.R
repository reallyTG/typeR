library(parcor)


### Name: adalasso.net
### Title: Partial Correlations with (Adaptive) Lasso
### Aliases: adalasso.net
### Keywords: multivariate

### ** Examples

n<-20
p<-10
X<-matrix(rnorm(n*p),ncol=p)
pc<-adalasso.net(X,k=5)




