library(deepboost)


### Name: predict,Deepboost-method
### Title: Predict method for Deepboost model
### Aliases: predict,Deepboost-method

### ** Examples

dpb <- deepboost(y ~ .,
 data.frame(x1=rep(c(0,0,1,1),2),x2=rep(c(0,1,0,1),2),y=factor(rep(c(0,0,0,1),2))),
 num_iter=2,tree_depth=2)
predict(dpb,data.frame(x1=rep(c(1,1,1,0),2),x2=rep(c(1,1,1,1),2)))



