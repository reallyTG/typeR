library(PReMiuM)


### Name: heatDissMat
### Title: Plot the heatmap of the dissimilarity matrix
### Aliases: heatDissMat

### ** Examples

## Not run: 
##D # generate simulated dataset
##D generateDataList <- clusSummaryBernoulliDiscreteSmall()
##D inputs <- generateSampleDataFile(generateDataList)
##D 
##D # run profile regression
##D runInfoObj<-profRegr(yModel=inputs$yModel, xModel=inputs$xModel, 
##D  nSweeps=10, nBurn=2000, data=inputs$inputData, output="output", 
##D  covNames=inputs$covNames,nClusInit=15)
##D 
##D # compute dissimilarity matrix     
##D dissimObj<-calcDissimilarityMatrix(runInfoObj)
##D 
##D # plot heatmap
##D heatDissMat(dissimObj)
## End(Not run)



