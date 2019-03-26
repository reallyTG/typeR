library(pcensmix)


### Name: mixgen
### Title: Generating Mixture Datasets
### Aliases: mixgen

### ** Examples

## Generate a sample from a two component Normal-Weibull mixture distribution
## with mixing components as N(12, 2) and Weibull(15, 4), mixing proportion 0.3
## and size of N = 20.

mixture<- mixgen(N = 20, dist1 = 'norm', dist2 = 'weibull', control = list(12, 2, 15, 4, 0.3))




