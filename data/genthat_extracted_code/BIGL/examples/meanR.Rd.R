library(BIGL)


### Name: meanR
### Title: Compute meanR statistic for the estimated model
### Aliases: meanR

### ** Examples

  data <- subset(directAntivirals, experiment == 2)
  ## Data must contain d1, d2 and effect columns
  fitResult <- fitMarginals(data)
  CP <- CPBootstrap(data, fitResult, null_model = "loewe", B.CP = 5)
  meanR(data, fitResult, null_model = "loewe", CP = CP)



