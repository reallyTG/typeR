library(FuzzyAHP)


### Name: pairwiseComparisonMatrix
### Title: Function that creates Pairwise Comparions Matrix
### Aliases: pairwiseComparisonMatrix
###   pairwiseComparisonMatrix,matrix-method

### ** Examples

comparisonMatrixValues = c("1","9","5","1/9","1","1/3","1/5","3","1")
comparisonMatrix = matrix(comparisonMatrixValues, nrow = 3, ncol = 3, byrow = TRUE)
matrix = pairwiseComparisonMatrix(comparisonMatrix)

comparisonMatrixValues = c(1,9,5,1/9,1,1/3,1/5,3,1)
comparisonMatrix = matrix(comparisonMatrixValues, nrow = 3, ncol = 3, byrow = TRUE)
matrix = pairwiseComparisonMatrix(comparisonMatrix)




