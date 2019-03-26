library(circular)


### Name: medianHL.circular
### Title: Median using Hodges-Lehmann estimate.
### Aliases: medianHL.circular medianHL medianHL.default
### Keywords: univar

### ** Examples

# Compute the median direction of a random sample of observations.
  x <- circular(runif(50, circular(0), pi))
# Calculate the three medians for each method without \code{prop} argument.
  medianHL.circular(x,method="HL1")
  medianHL.circular(x,method="HL2")
  medianHL.circular(x,method="HL3")



