library(RoughSetKnowledgeReduction)


### Name: checkConsistency
### Title: CHECK CONSISTENCY
### Aliases: checkConsistency
### Keywords: logic rough set

### ** Examples

exampleMatrix1 <- matrix(c(1,0,2,1,1,2,2,0,0,1,0,1,0,2,1,
1,2,1,0,0,2,0,1,1,2,1,1,2,0,1,1,0,0,2,1,2,1,1,2,1),ncol = 5)
ruleConsistencyDT <- new(Class="DecisionTable",decisionTable = exampleMatrix1)
ruleConsistencyResults <- checkConsistency(ruleConsistencyDT)



