library(parcor)


### Name: mylars
### Title: Cross-validation for Lasso
### Aliases: mylars
### Keywords: multivariate

### ** Examples


n<-20
p<-50
X<-matrix(rnorm(n*p),ncol=p)
y<-rnorm(n)
dummy<-mylars(X,y)




