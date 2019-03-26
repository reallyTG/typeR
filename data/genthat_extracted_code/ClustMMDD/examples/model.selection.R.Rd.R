library(ClustMMDD)


### Name: model.selection.R
### Title: Selection of both the number K of clusters and the subset S of
###   clustering variables.
### Aliases: model.selection.R
### Keywords: Classification Cluster Slope-heuristics Model selection
###   Penalized maximum log-likelihood

### ** Examples

data(genotype2_ExploredModels)
outDimJump = dimJump.R(genotype2_ExploredModels, N = 1000, h = 5, header = TRUE)
cte1 = outDimJump[[1]][1]
outSlection = model.selection.R(genotype2_ExploredModels, cte = cte1, header = TRUE)
outSlection



