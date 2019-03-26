library(RoughSetKnowledgeReduction)


### Name: getRule
### Title: GET RULE
### Aliases: getRule
### Keywords: logic rough set

### ** Examples

exampleMatrix1 <- matrix(c(1,0,2,1,1,2,2,0,0,1,0,1,0,2,1,1,2,
1,0,0,2,0,1,1,2,1,1,2,0,1,1,0,0,2,1,2,1,1,2,1),ncol = 5)
dt <- decisionTable(exampleMatrix1)
ruleIndex <- c(1,2,4,7,8)
ruleSet <- getRule(dt,ruleIndex)



