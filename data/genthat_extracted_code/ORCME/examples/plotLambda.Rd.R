library(ORCME)


### Name: plotLambda
### Title: Plot the variaty of the properties dependent on the proportion
###   of heterogeneity in observed data set
### Aliases: plotLambda
### Keywords: cluster

### ** Examples

  data(doseData)
  data(geneData)

  dirData <- monotoneDirection(geneData = geneData,doseData = doseData)
  incData <- as.data.frame(dirData$incData)
 
  lambdaVector <- c(0.05,0.50,0.95)
  
  ## No test: 
  lambdaChoiceOutput <- resampleORCME(clusteringData=incData, lambdaVector=lambdaVector)
  plotLambda(lambdaChoiceOutput,output="wss")
  plotLambda(lambdaChoiceOutput,output="ncluster")
  plotLambda(lambdaChoiceOutput,output="pwss")
  plotLambda(lambdaChoiceOutput,output="ch")
  plotLambda(lambdaChoiceOutput,output="h")
  
## End(No test)



