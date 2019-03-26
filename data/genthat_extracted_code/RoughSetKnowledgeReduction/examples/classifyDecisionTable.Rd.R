library(RoughSetKnowledgeReduction)


### Name: classifyDecisionTable
### Title: CLASSIFY DECISION TABLE
### Aliases: classifyDecisionTable
### Keywords: logic rough set

### ** Examples

exampleMatrix1 <- matrix(c(1,0,2,1,1,2,2,0,0,1,0,1,0,2,1,
1,2,1,0,0,2,0,1,1,2,1,1,2,0,1,1,0,0,2,1,2,1,1,2,1),ncol = 5)
exampleMatrix2 <- matrix(c(1,1,0,1,1,2,2,0,0,0,1,1,1,2,0,0,
0,0,0,0,2,1,0,0,1,2,2,2,1,1,0,0,2,2,2),ncol = 5)
dt1 <- new(Class="DecisionTable",decisionTable = exampleMatrix1)
dt2 <- new(Class="DecisionTable",decisionTable = exampleMatrix2)
vr1 <- simplifyDecisionTable(dt1)
dt3 <- classifyDecisionTable(vr1,dt2)#It classifies dt2 with the rules obtained from dt1
dt3 <- removeDuplicatedRulesDT(dt3)



