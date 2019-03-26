library(PReMiuM)


### Name: plotRiskProfile
### Title: Plot the Risk Profiles
### Aliases: plotRiskProfile
### Keywords: plots postprocessing

### ** Examples

## Not run: 
##D # example for Poisson outcome and Discrete covariates
##D inputs <- generateSampleDataFile(clusSummaryPoissonDiscrete())
##D runInfoObj<-profRegr(yModel=inputs$yModel, 
##D     xModel=inputs$xModel, nSweeps=10, nClusInit=15,
##D     nBurn=20, data=inputs$inputData, output="output", 
##D     covNames = inputs$covNames, outcomeT = inputs$outcomeT,
##D     fixedEffectsNames = inputs$fixedEffectNames)
##D 
##D dissimObj<-calcDissimilarityMatrix(runInfoObj)
##D clusObj<-calcOptimalClustering(dissimObj)
##D riskProfileObj<-calcAvgRiskAndProfile(clusObj)
##D clusterOrderObj<-plotRiskProfile(riskProfileObj,"summary.png")
## End(Not run)



