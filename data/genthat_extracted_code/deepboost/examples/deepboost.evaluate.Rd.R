library(deepboost)


### Name: deepboost.evaluate
### Title: Evaluates and prints statistics for a deepboost model
### Aliases: deepboost.evaluate

### ** Examples

dpb <- deepboost(y ~ .,
 data.frame(x1=rep(c(0,0,1,1),2),x2=rep(c(0,1,0,1),2),y=factor(rep(c(0,0,0,1),2))),
 num_iter=2,tree_depth=2)
deepboost.evaluate(dpb,data.frame(x1=rep(c(1,1,1,0),2),x2=rep(c(1,1,1,1),2)))



