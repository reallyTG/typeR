library(BIGL)


### Name: outsidePoints
### Title: List non-additive points
### Aliases: outsidePoints

### ** Examples

  data <- subset(directAntivirals, experiment == 2)
  ## Data must contain d1, d2 and effect columns
  fitResult <- fitMarginals(data)
  CP <- CPBootstrap(data, fitResult, null_model = "loewe", B.CP = 5)
  statM <- maxR(data, fitResult, null_model = "loewe", CP = CP)
  outsidePoints(statM$Ymean)



