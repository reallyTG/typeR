library(ORCME)


### Name: ORCME
### Title: Order restricted clustering for dose-response trends in
###   microarray experiments
### Aliases: ORCME
### Keywords: cluster

### ** Examples

  data(doseData)
  data(geneData)

  dirData <- monotoneDirection(geneData = geneData,doseData = doseData)
  incData <- as.data.frame(dirData$incData)
  
  ## No test: 
  print(orcme <- ORCME(DRdata=incData,lambda=0.15,phi=2))
  orcmeRobust <- ORCME(DRdata=incData,lambda=0.15,phi=2, robust=TRUE)
  
  # number of genes within cluster
  colSums(orcme)
  colSums(orcmeRobust)
  
## End(No test)



