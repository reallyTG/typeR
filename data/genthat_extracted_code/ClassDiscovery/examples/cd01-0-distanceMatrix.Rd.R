library(ClassDiscovery)


### Name: distanceMatrix
### Title: Distance Matrix Computation
### Aliases: distanceMatrix
### Keywords: array

### ** Examples

dd <- matrix(rnorm(100*5, rnorm(100)), nrow=100, ncol=5)
distanceMatrix(dd, 'pearson')
distanceMatrix(dd, 'euclid')
distanceMatrix(dd, 'sqrt')
distanceMatrix(dd, 'weird')
rm(dd) # cleanup



