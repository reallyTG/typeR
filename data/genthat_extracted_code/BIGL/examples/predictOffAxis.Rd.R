library(BIGL)


### Name: predictOffAxis
### Title: Compute off-axis predictions
### Aliases: predictOffAxis

### ** Examples

  data <- subset(directAntivirals, experiment == 1)
  ## Data must contain d1, d2 and effect columns
  transforms <- getTransformations(data)
  fitResult <- fitMarginals(data, transforms)
  predictOffAxis(data, fitResult, null_model = "hsa")



