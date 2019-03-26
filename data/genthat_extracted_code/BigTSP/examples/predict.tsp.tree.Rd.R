library(BigTSP)


### Name: predict.tsp.tree
### Title: prediction function for tsp.tree
### Aliases: predict.tsp.tree
### Keywords: ~kwd1 ~kwd2

### ** Examples

library(tree)
x=matrix(rnorm(100*20),100,20)
y=rbinom(100,1,0.5)
y=as.factor(y)
data=data.frame(y,x)
tr=tsp.tree(x,y)
predict(tr,data[1:10,])



