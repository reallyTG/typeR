library(PerseusR)


### Name: as.matrixData.ExpressionSet
### Title: Coerces an ExpressionSet into a MatrixData
### Aliases: as.matrixData.ExpressionSet

### ** Examples


## No test: 
eSet <- eSet <- Biobase::ExpressionSet(matrix(1:10, ncol = 2))
mD <- as(eSet, "matrixData")
print(mD)
## End(No test)



