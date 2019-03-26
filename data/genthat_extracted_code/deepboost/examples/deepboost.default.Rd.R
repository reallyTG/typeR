library(deepboost)


### Name: deepboost.default
### Title: Main function for deepboost model creation
### Aliases: deepboost.default

### ** Examples

deepboost.default(data.frame(x1=rep(c(0,0,1,1),2),x2=rep(c(0,1,0,1),2)),
 factor(rep(c(0,0,0,1),2)),num_iter=1)
deepboost.default(data.frame(x1=rep(c(0,0,1,1),2),x2=rep(c(0,1,0,1),2)),
 factor(rep(c(0,0,0,1),2)),
 num_iter=2, beta=0.1, lambda=0.00125)



