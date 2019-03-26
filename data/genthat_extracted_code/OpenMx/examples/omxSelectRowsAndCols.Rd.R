library(OpenMx)


### Name: omxSelectRowsAndCols
### Title: Filter rows and columns from an mxMatrix
### Aliases: omxSelectRowsAndCols omxSelectRows omxSelectCols

### ** Examples

loadings <- c(1, -0.625, 0.1953125, 1, -0.375, 0.0703125, 1, -0.375, 0.0703125)
loadings <- matrix(loadings, 3, 3, byrow= TRUE)
existenceList <- c(1, 0, 1)
existenceList <- matrix(existenceList, 1, 3, byrow= TRUE)
rowsAndCols <- omxSelectRowsAndCols(loadings, existenceList)
rows <- omxSelectRows(loadings, existenceList)
cols <- omxSelectCols(loadings, existenceList)



