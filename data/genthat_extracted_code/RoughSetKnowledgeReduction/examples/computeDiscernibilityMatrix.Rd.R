library(RoughSetKnowledgeReduction)


### Name: computeDiscernibilityMatrix
### Title: COMPUTE DISCERNIBILITY MATRIX
### Aliases: computeDiscernibilityMatrix
### Keywords: logic rough set

### ** Examples

exampleMatrix2 <- matrix(c(1,1,0,1,1,2,2,0,0,0,1,1,1,2,0,
0,0,0,0,0,2,1,0,0,1,2,2,2,1,1,0,0,2,2,2),ncol = 5)
disMatDT <- new(Class="DecisionTable",decisionTable = exampleMatrix2)
dm <- computeDiscernibilityMatrix(disMatDT)



