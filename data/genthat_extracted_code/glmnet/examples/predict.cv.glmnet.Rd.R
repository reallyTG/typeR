library(glmnet)


### Name: predict.cv.glmnet
### Title: make predictions from a "cv.glmnet" object.
### Aliases: coef.cv.glmnet predict.cv.glmnet
### Keywords: models regression

### ** Examples

x=matrix(rnorm(100*20),100,20)
y=rnorm(100)
cv.fit=cv.glmnet(x,y)
predict(cv.fit,newx=x[1:5,])
coef(cv.fit)
coef(cv.fit,s="lambda.min")
predict(cv.fit,newx=x[1:5,],s=c(0.001,0.002))



