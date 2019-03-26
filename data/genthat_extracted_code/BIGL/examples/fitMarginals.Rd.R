library(BIGL)


### Name: fitMarginals
### Title: Fit two 4-parameter log-logistic functions for a synergy
###   experiment
### Aliases: fitMarginals

### ** Examples

  data <- subset(directAntivirals, experiment == 1)
  ## Data must contain d1, d2 and effect columns
  transforms <- getTransformations(data)
  fitMarginals(data, transforms)



