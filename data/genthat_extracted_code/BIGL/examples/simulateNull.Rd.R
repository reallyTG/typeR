library(BIGL)


### Name: simulateNull
### Title: Simulate data from a given null model and monotherapy
###   coefficients
### Aliases: simulateNull

### ** Examples

  data <- subset(directAntivirals, experiment == 1)
  ## Data must contain d1, d2 and effect columns
  fitResult <- fitMarginals(data)
  simulateNull(data, fitResult, null_model = "hsa")



