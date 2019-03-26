library(PReMiuM)


### Name: calcDissimilarityMatrix
### Title: Calculates the dissimilarity matrix
### Aliases: calcDissimilarityMatrix
### Keywords: postprocessing

### ** Examples

generateDataList <- clusSummaryBernoulliDiscrete()
inputs <- generateSampleDataFile(generateDataList)
runInfoObj<-profRegr(yModel=inputs$yModel, xModel=inputs$xModel, 
    nSweeps=10, nBurn=20, data=inputs$inputData, output="output", 
    covNames=inputs$covNames,nClusInit=15)

dissimObj<-calcDissimilarityMatrix(runInfoObj)




