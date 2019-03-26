library(plsdof)


### Name: coef.plsdof
### Title: Regression coefficients
### Aliases: coef.plsdof
### Keywords: models

### ** Examples


n<-50 # number of observations
p<-5 # number of variables
X<-matrix(rnorm(n*p),ncol=p)
y<-rnorm(n)


pls.object<-pls.ic(X,y,criterion="bic")
mycoef<-coef(pls.object)



