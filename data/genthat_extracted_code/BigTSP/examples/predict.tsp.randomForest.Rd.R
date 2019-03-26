library(BigTSP)


### Name: predict.tsp.randomForest
### Title: prediction function for tsp.randomForest
### Aliases: predict.tsp.randomForest
### Keywords: ~kwd1 ~kwd2

### ** Examples

library(randomForest)
x=matrix(rnorm(100*20),100,20)
y=rbinom(100,1,0.5)
y=as.factor(y)
fit=tsp.randomForest(x,y)
predict(fit,x[1:10,])



