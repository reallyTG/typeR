library(BIGL)


### Name: initialMarginal
### Title: Estimate initial values for fitting marginal dose-response
###   curves
### Aliases: initialMarginal

### ** Examples

  data <- subset(directAntivirals, experiment == 1)
  ## Data must contain d1, d2 and effect columns
  transforms <- getTransformations(data)
  initialMarginal(data, transforms)



