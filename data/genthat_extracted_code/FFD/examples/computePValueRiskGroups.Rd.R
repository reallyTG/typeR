library(FFD)


### Name: computePValueRiskGroups
### Title: FUNCTION to compute the probability of finding no testpositives
###   in a sample of a certain size for a population stratified into risk
###   groups.
### Aliases: computePValueRiskGroups
### Keywords: misc

### ** Examples

nPopulationVec <- c(500,700)
nSampleVec <- c(300,200)
nRelRiskVec <- c(1,1)
nDiseased <- round(sum(nPopulationVec)*0.01)
sensitivity <- 0.9
specificity <- 1
alphaError <- computePValue(sum(nPopulationVec), sum(nSampleVec),
	nDiseased, sensitivity, specificity)



