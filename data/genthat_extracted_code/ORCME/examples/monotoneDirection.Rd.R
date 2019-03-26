library(ORCME)


### Name: monotoneDirection
### Title: The monotone means under increasing/decreasing trend
### Aliases: monotoneDirection
### Keywords: cluster

### ** Examples

  data(doseData)
  data(geneData)

  dirData <- monotoneDirection(geneData = geneData,doseData = doseData)

  ## direction of monotone trend
  Direction <- dirData$direction
  ## Isotonic means for upward genes
  incData <- as.data.frame(dirData$incData)
  ##Isotonic means for downward genes
  decData <- as.data.frame(dirData$decData)
  ## observd data upward genes
  obsIncData <- as.data.frame(dirData$obsincData)
  ## observed data for downward genes
  obsDecData <- as.data.frame(dirData$obsdecData)
  ## isotonic means for all genes
  isoMeans <- as.data.frame(dirData$arrayMean)




