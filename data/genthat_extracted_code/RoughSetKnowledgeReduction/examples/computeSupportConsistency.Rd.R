library(RoughSetKnowledgeReduction)


### Name: computeSupportConsistency
### Title: COMPUTE SUPPORT CONSISTENCY
### Aliases: computeSupportConsistency
### Keywords: logic rough set

### ** Examples

exampleMatrix2 <- matrix(c(1,1,0,1,1,2,2,0,0,0,1,1,1,2,0,
0,0,0,0,0,2,1,0,0,1,2,2,2,1,1,0,0,2,2,2),ncol = 5)
dt <- new(Class="DecisionTable",decisionTable = exampleMatrix2)
dtUnique <- removeDuplicatedRulesDT(dt)
cr <- new(Class="ConditionReduct",decisionTable = dtUnique,columnIds=c(1,2,4,5))
cr <- removeDuplicatedRulesCR(cr)
vr <- computeValueReduct(cr)
vr <- removeDuplicatedRulesVR(vr)
mat <- computeSupportConsistency(vr,dt)
print(mat)



