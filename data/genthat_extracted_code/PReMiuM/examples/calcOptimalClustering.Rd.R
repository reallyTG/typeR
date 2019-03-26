library(PReMiuM)


### Name: calcOptimalClustering
### Title: Calculation of the optimal clustering
### Aliases: calcOptimalClustering
### Keywords: postprocessing

### ** Examples

## Not run: 
##D generateDataList <- clusSummaryBernoulliDiscrete()
##D inputs <- generateSampleDataFile(generateDataList)
##D runInfoObj<-profRegr(yModel=inputs$yModel, xModel=inputs$xModel, 
##D     nSweeps=10, nBurn=20, data=inputs$inputData, output="output", 
##D     covNames=inputs$covNames, nClusInit=15)
##D 
##D dissimObj<-calcDissimilarityMatrix(runInfoObj)
##D clusObj<-calcOptimalClustering(dissimObj)
## End(Not run)



