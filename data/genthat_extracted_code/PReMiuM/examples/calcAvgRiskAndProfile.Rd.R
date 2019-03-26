library(PReMiuM)


### Name: calcAvgRiskAndProfile
### Title: Calculation of the average risks and profiles
### Aliases: calcAvgRiskAndProfile
### Keywords: postprocessing

### ** Examples

## Not run: 
##D generateDataList <- clusSummaryBernoulliDiscrete()
##D inputs <- generateSampleDataFile(generateDataList)
##D runInfoObj<-profRegr(yModel=inputs$yModel, xModel=inputs$xModel, nSweeps=10, 
##D     nBurn=20, data=inputs$inputData, output="output", nClusInit=15,
##D     covNames=inputs$covNames)
##D 
##D dissimObj<-calcDissimilarityMatrix(runInfoObj)
##D clusObj<-calcOptimalClustering(dissimObj)
##D riskProfileObj<-calcAvgRiskAndProfile(clusObj)
## End(Not run)



