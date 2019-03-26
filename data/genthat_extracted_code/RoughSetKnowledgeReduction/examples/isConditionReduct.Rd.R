library(RoughSetKnowledgeReduction)


### Name: isConditionReduct
### Title: IS CONDITION REDUCT
### Aliases: isConditionReduct
### Keywords: logic rough set

### ** Examples

exampleMatrix2 <- matrix(c(1,1,0,1,1,2,2,0,0,0,1,1,1,2,0,0,0,
0,0,0,2,1,0,0,1,2,2,2,1,1,0,0,2,2,2),ncol = 5)
dt <- new(Class="DecisionTable",decisionTable = exampleMatrix2)
cr1 <- new(Class="ConditionReduct",decisionTable = dt,columnIds=c(1,2,4,5))
cr2 <- new(Class="ConditionReduct",decisionTable = dt,columnIds=c(1,2,5))
isConditionReduct(cr1) == TRUE
isConditionReduct(cr2) == FALSE



