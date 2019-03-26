library(ppls)


### Name: coef.mypls
### Title: Regression coefficients
### Aliases: coef.mypls
### Keywords: models

### ** Examples


n<-50 # number of observations
p<-5 # number of variables
X<-matrix(rnorm(n*p),ncol=p)
y<-rnorm(n)


pls.object<-penalized.pls.cv(X,y)
my.jack<-jack.ppls(pls.object)
mycoed<-coef(my.jack)



