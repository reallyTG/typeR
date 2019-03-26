library(svmpath)


### Name: predict.svmpath
### Title: Make predictions from a "svmpath" object
### Aliases: predict.svmpath
### Keywords: regression

### ** Examples

data(svmpath)
attach(balanced.overlap)
fit <- svmpath(x,y,trace=TRUE,plot=TRUE)
predict(fit, lambda=1,type="alpha")
predict(fit, x, lambda=.9)
detach(2)



