library(BigTSP)


### Name: predict.cv.LDCA
### Title: prediction function for cv.LDCA
### Aliases: predict.cv.LDCA
### Keywords: ~kwd1 ~kwd2

### ** Examples

library(glmnet)
x=matrix(rnorm(50*20),50,20)
y=rbinom(50,1,0.5)
cvfit=cv.LDCA(x,y,nfolds=5)
predict(cvfit,x[1:10,],s="lambda.min")



