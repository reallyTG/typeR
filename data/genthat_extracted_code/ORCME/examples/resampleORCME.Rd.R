library(ORCME)


### Name: resampleORCME
### Title: Estimation of the proportion of the heterogeneity in the
###   observed data for clustering
### Aliases: resampleORCME
### Keywords: cluster

### ** Examples

  data(doseData)
  data(geneData)

  dirData <- monotoneDirection(geneData = geneData,doseData = doseData)
  incData <- as.data.frame(dirData$incData)
 
  lambdaVector <- c(0.05,0.50,0.95)
  
  ## No test: 
  resampleORCME(clusteringData=incData, lambdaVector=lambdaVector, robust=FALSE)
  
## End(No test)



