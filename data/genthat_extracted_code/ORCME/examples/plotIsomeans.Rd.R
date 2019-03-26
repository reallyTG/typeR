library(ORCME)


### Name: plotIsomeans
### Title: Plot of the observed gene expression and the isotonic means with
###   respect to dose
### Aliases: plotIsomeans
### Keywords: cluster

### ** Examples

  data(doseData)
  data(geneData)

  dirData <- monotoneDirection(geneData = geneData,doseData = doseData)
  incData <- as.data.frame(dirData$incData)
  obsIncData <- as.data.frame(dirData$obsincData)
  
  ## gene-specific profile plot
  plotIsomeans(monoData=incData,obsData=obsIncData,doseData=
  doseData,geneIndex=10)




