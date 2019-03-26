library(inTrees)


### Name: GBM2List
### Title: Transform gbm object to a list of trees
### Aliases: GBM2List
### Keywords: gbm

### ** Examples

    library(gbm)
    data(iris)
    X <- iris[,1:(ncol(iris)-1)]
    target <- iris[,"Species"] 
    gbmFit <- gbm(Species~ ., data=iris, n.tree = 400,
                    interaction.depth = 10,distribution="multinomial")
    treeList <- GBM2List(gbmFit,X)
    ruleExec = extractRules(treeList,X)
    ruleExec <- unique(ruleExec)
    #ruleExec <- ruleExec[1:min(2000,length(ruleExec)),,drop=FALSE]
    ruleMetric <- getRuleMetric(ruleExec,X,target)
    ruleMetric <- pruneRule(ruleMetric,X,target)
    ruleMetric <- unique(ruleMetric)
    learner <- buildLearner(ruleMetric,X,target)
    pred <- applyLearner(learner,X)
    readableLearner <- presentRules(learner,colnames(X)) # more readable format
    err <- 1-sum(pred==target)/length(pred);



