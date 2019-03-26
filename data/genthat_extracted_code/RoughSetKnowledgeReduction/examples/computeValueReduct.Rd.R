library(RoughSetKnowledgeReduction)


### Name: computeValueReduct
### Title: COMPUTE VALUE REDUCT
### Aliases: computeValueReduct
### Keywords: logic rough set

### ** Examples

exampleMatrix2 <- matrix(c(1,1,0,1,1,2,2,0,0,0,1,1,1,2,0,
0,0,0,0,0,2,1,0,0,1,2,2,2,1,1,0,0,2,2,2),ncol = 5)
dt <- new(Class="DecisionTable",decisionTable = exampleMatrix2)
cr <- new(Class="ConditionReduct",decisionTable = dt,columnIds=c(1,2,4,5))
vr <- computeValueReduct(cr)



