library(RoughSetKnowledgeReduction)


### Name: conditionReduct
### Title: CONDITION REDUCT
### Aliases: conditionReduct
### Keywords: logic rough set

### ** Examples

exampleMatrix2 <- matrix(c(1,1,0,1,1,2,2,0,0,0,1,1,1,2,0,
0,0,0,0,0,2,1,0,0,1,2,2,2,1,1,0,0,2,2,2),ncol = 5)
dt <- new(Class="DecisionTable",decisionTable = exampleMatrix2)
cr1 <- conditionReduct(dt,c(1,2,4,5))
isConditionReduct(cr1) == TRUE# Test if cr1 actually is a condition reduct of dt
cr2 <- findFirstConditionReduct(dt)# Gets the first found condition reduct in dt
listCr1 <- findSmallestReductFamilyFromCore(dt)# Gets a set of the least condition reducts of dt
listCr2 <- findAllReductsFromCore(dt)# Gets all the reducts from dt



