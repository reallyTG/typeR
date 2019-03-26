library(inTrees)


### Name: getRuleMetric
### Title: Assign outcomes to a conditions, and measure the rules
### Aliases: getRuleMetric
### Keywords: measure rank

### ** Examples

library(RRF)
data(iris)
X <- iris[,1:(ncol(iris)-1)]
target <- iris[,"Species"] 
rf <- RRF(X,as.factor(target),ntree=100) # build an ordinary RF 
treeList <- RF2List(rf)
ruleExec <- extractRules(treeList,X) # transform to R-executable rules
ruleExec <- unique(ruleExec)
ruleMetric <- getRuleMetric(ruleExec,X,target) # measure rules



