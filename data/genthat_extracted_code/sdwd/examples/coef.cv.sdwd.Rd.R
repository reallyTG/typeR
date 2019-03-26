library(sdwd)


### Name: coef.cv.sdwd
### Title: compute coefficients from a "cv.sdwd" object
### Aliases: coef.cv.sdwd
### Keywords: models regression

### ** Examples

data(colon)
colon$x = colon$x[ ,1:100] # this example only uses the first 100 columns 
set.seed(1)
cv = cv.sdwd(colon$x, colon$y, lambda2=1, nfolds=5)
c1 = coef(cv, s="lambda.1se")



