library(ORCME)


### Name: plotCluster
### Title: Plotting the gene specific profiles for one given cluster of
###   genes
### Aliases: plotCluster
### Keywords: cluster

### ** Examples

  data(doseData)
  data(geneData)

  ## No test: 
  dirData <- monotoneDirection(geneData = geneData,doseData = doseData)
  incData <- as.data.frame(dirData$incData)
  ORCMEoutput <- ORCME(DRdata=incData,lambda=0.15,phi=2)
  
  plotCluster(DRdata=incData,doseData=doseData, ORCMEoutput=ORCMEoutput,
  clusterID=4,zeroMean=FALSE, xlabel="Dose",ylabel="Gene Expression")
  
## End(No test)



