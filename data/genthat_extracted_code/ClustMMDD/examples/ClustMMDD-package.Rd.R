library(ClustMMDD)


### Name: ClustMMDD-package
### Title: 'ClustMMDD' : Clustering by Mixture Models for Discrete Data.
### Aliases: ClustMMDD-package ClustMMDD
### Keywords: Population genetics Clustering Unsupervized classification
###   Mixture of multinomial models Expectation and Maximisation Model
###   selection Slope-heuristics Dimension jump

### ** Examples

data(genotype2)
head(genotype2)
data(genotype2_ExploredModels)
head(genotype2_ExploredModels)

#Calibration of the penalty function
outDimJump = dimJump.R(genotype2_ExploredModels, N = 1000, h = 5, header = TRUE)
cte1 = outDimJump[[1]][1]
outSlection = model.selection.R(genotype2_ExploredModels, cte = cte1, header = TRUE)
outSlection



