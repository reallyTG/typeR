library(BIGL)


### Name: maxR
### Title: Compute maxR statistic for each off-axis dose combination
### Aliases: maxR

### ** Examples

  data <- subset(directAntivirals, experiment == 2)
  ## Data must contain d1, d2 and effect columns
  fitResult <- fitMarginals(data)
  CP <- CPBootstrap(data, fitResult, null_model = "loewe", B.CP = 5)
  maxR(data, fitResult, null_model = "loewe", CP = CP)



