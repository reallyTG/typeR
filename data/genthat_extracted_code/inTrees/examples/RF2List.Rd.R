library(inTrees)


### Name: RF2List
### Title: Transform a random forest object to a list of trees
### Aliases: RF2List
### Keywords: randomforest

### ** Examples

library(RRF)
data(iris)
X <- iris[,1:(ncol(iris)-1)]
target <- iris[,"Species"] 
rf <- RRF(X,as.factor(target),ntree=100) # build an ordinary RF 
treeList <- RF2List(rf)
ruleExec <- extractRules(treeList,X) # transform to R-executable rules



