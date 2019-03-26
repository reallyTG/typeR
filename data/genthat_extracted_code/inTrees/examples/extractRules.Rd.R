library(inTrees)


### Name: extractRules
### Title: Extract rules from a list of trees
### Aliases: extractRules
### Keywords: extract

### ** Examples

    library(RRF)
    data(iris)
    X <- iris[,1:(ncol(iris)-1)]
    target <- iris[,"Species"] 
    rf <- RRF(X,as.factor(target),ntree=100) # build an ordinary RF 
    treeList <- RF2List(rf)
    ruleExec <- extractRules(treeList,X,digits=4) # transform to R-executable rules
    ruleExec <- unique(ruleExec)



