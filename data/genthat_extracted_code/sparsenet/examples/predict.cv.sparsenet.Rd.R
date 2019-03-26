library(sparsenet)


### Name: predict.cv.sparsenet
### Title: make predictions from a "cv.sparsenet" object.
### Aliases: coef.cv.sparsenet predict.cv.sparsenet
### Keywords: lasso subset

### ** Examples

x=matrix(rnorm(100*20),100,20)
y=rnorm(100)
fitcv=cv.sparsenet(x,y)
predict(fitcv,x)



