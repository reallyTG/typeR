library(ClustMMDD)


### Name: genotype2_ExploredModels
### Title: A data frame of competing models gathered by
###   'backward.explorer'.
### Aliases: genotype2_ExploredModels
### Keywords: Backward-Stepwise selection Model selection in clustering
###   Population structure Genotype data

### ** Examples

data(genotype2_ExploredModels)
head(genotype2_ExploredModels)
plot(genotype2_ExploredModels[, c("dim", "logLik")],
	 col = "blue", xlab = "Dimension", ylab = "Log-likelihood")

# Data-driven calibration of the penalty
dimJump.R(genotype2_ExploredModels, h = 5, N=1000, header=T)



