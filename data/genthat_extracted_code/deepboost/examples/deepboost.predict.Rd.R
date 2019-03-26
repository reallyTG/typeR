library(deepboost)


### Name: deepboost.predict
### Title: Predicts instances responses based on a deepboost model
### Aliases: deepboost.predict

### ** Examples

dpb <- deepboost(y ~ .,
 data.frame(x1=rep(c(0,0,1,1),2),x2=rep(c(0,1,0,1),2),y=factor(rep(c(0,0,0,1),2))),
 num_iter=2,tree_depth=2)
deepboost.predict(dpb,data.frame(x1=rep(c(1,1,1,0),5),x2=rep(c(1,1,1,1),5)))



