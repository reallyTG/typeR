library(BigTSP)


### Name: tsp.tree
### Title: Fit a Classification Tree based on Top Scoring Pairs.
### Aliases: tsp.tree

### ** Examples

library(tree)
x=matrix(rnorm(100*20),100,20)
y=rbinom(100,1,0.5)
y=as.factor(y)
data=data.frame(y,x)
tr=tsp.tree(x,y)
predict(tr,data[1:10,])
plot(tr)
text(tr)



