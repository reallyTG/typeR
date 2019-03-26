library(ClustMMDD)


### Name: dimJump.R
### Title: Data driven calibration of the penalty function
### Aliases: dimJump.R
### Keywords: Classification Cluster Slope-heuristics Model selection
###   Penalized maximum log-likelihood

### ** Examples

# genotype2_ExploredModels was obtained via backward.explorer.
data(genotype2_ExploredModels)
outDimJump = dimJump.R(genotype2_ExploredModels, N = 1000, h = 5, header = TRUE)
outDimJump[[1]]



