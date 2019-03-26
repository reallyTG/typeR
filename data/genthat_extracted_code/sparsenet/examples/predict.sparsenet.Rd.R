library(sparsenet)


### Name: predict.sparsenet
### Title: make predictions from a "sparsenet" object.
### Aliases: coef.sparsenet predict.sparsenet
### Keywords: lasso subset

### ** Examples

x=matrix(rnorm(100*20),100,20)
y=rnorm(100)
fit=sparsenet(x,y)
predict(fit, which.gamma=5,type="nonzero")
predict(fit,x)



