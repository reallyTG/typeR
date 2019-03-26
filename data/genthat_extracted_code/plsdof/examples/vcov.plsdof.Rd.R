library(plsdof)


### Name: vcov.plsdof
### Title: Variance-covariance matrix
### Aliases: vcov.plsdof
### Keywords: models

### ** Examples


n<-50 # number of observations
p<-5 # number of variables
X<-matrix(rnorm(n*p),ncol=p)
y<-rnorm(n)


pls.object<-pls.ic(X,y,m=5,criterion="bic")
my.vcov<-vcov(pls.object)
my.sd<-sqrt(diag(my.vcov)) # standard deviation of regression coefficients



