library(FFD)


### Name: computeOptimalSampleSizeRiskGroups
### Title: FUNCTION to compute the optimal sample size for populations
###   stratified by risk factors.
### Aliases: computeOptimalSampleSizeRiskGroups
### Keywords: misc

### ** Examples

nPopulationVec <- c(500,700)
nRelRiskVec <- c(1,3)
prevalence <- 0.01
alpha <- 0.05
herdSensitivity <- 0.7
specificity <- 1

## Optimal sample size with risk groups: 
nRisk <- computeOptimalSampleSizeRiskGroups(nPopulationVec = 
    nPopulationVec, nRelRiskVec = nRelRiskVec, 
	nSamplePropVec = c(1,4), prevalence = prevalence, 
	alpha = alpha, sensitivity = herdSensitivity, 
	specificity = specificity)
## Optimal sample size without risk groups: 
nNoRisk <- computeOptimalSampleSize(sum(nPopulationVec), 
    prevalence, alpha, herdSensitivity, specificity, FALSE)



