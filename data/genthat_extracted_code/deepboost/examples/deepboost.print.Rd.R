library(deepboost)


### Name: deepboost.print
### Title: Evaluates and prints statistics for a deepboost model on the
###   train set
### Aliases: deepboost.print

### ** Examples

dpb <- deepboost(y ~ .,
 data.frame(x1=rep(c(0,0,1,1),2),x2=rep(c(0,1,0,1),2),y=factor(rep(c(0,0,0,1),2))),
 num_iter=2,tree_depth=2)
deepboost.print(dpb)



