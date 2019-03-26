library(RoughSetKnowledgeReduction)


### Name: computeCore
### Title: COMPUTE CORE
### Aliases: computeCore
### Keywords: logic rough set

### ** Examples

exampleMatrix2 <- matrix(c(1,1,0,1,1,2,2,0,0,0,1,1,1,2,0,
0,0,0,0,0,2,1,0,0,1,2,2,2,1,1,0,0,2,2,2),ncol = 5)
disMatDT <- new(Class="DecisionTable",decisionTable = exampleMatrix2)
dm <- computeDiscernibilityMatrix(disMatDT)
core <- computeCore(dm)



