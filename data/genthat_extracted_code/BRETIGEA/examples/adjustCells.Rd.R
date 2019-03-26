library(BRETIGEA)


### Name: adjustCells
### Title: Adjust for estimated cell type proportions in bulk gene
###   expression data.
### Aliases: adjustCells

### ** Examples

## No test: 
svp_res = brainCells(inputMat = aba_marker_expression, nMarker = 10,
  species = "human", celltypes = c("ast", "neu", "oli"))
str(svp_res)
adjust_res = adjustCells(inputMat = aba_marker_expression,
  cellSPV = svp_res, addMeans = FALSE)
str(adjust_res)
## End(No test)



