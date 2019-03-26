library(BigTSP)


### Name: print.cv.LDCA
### Title: print function for cv.LDCA
### Aliases: print.cv.LDCA
### Keywords: ~kwd1 ~kwd2

### ** Examples

library(glmnet)
x=matrix(rnorm(50*20),50,20)
y=rbinom(50,1,0.5)
cvfit=cv.LDCA(x,y,nfolds=5)
print(cvfit)



