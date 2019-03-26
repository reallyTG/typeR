library(BIGL)


### Name: CPBootstrap
### Title: Estimate CP matrix with bootstrap
### Aliases: CPBootstrap

### ** Examples

  data <- subset(directAntivirals, experiment == 5)
  ## Data must contain d1, d2 and effect columns
  fitResult <- fitMarginals(data)
  CPBootstrap(data, fitResult, null_model = "loewe", B.CP = 5)



