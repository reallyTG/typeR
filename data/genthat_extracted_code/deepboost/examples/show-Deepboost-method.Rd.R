library(deepboost)


### Name: show,Deepboost-method
### Title: Print method for Deepboost model Evaluates a trained deepboost
###   model object.
### Aliases: show,Deepboost-method

### ** Examples

dpb <- deepboost(y ~ .,
 data.frame(x1=rep(c(0,0,1,1),2),x2=rep(c(0,1,0,1),2),y=factor(rep(c(0,0,0,1),2))),
 num_iter=2,tree_depth=2)
print(dpb)



