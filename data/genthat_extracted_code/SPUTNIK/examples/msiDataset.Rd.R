library(SPUTNIK)


### Name: msiDataset
### Title: Constructor for msi.dataset-class objects.
### Aliases: msiDataset

### ** Examples

## Load package
library("SPUTNIK")

## Create the msi.dataset-class object
sz <- c(5, 4)
numIons <- 20
x <- matrix(rnorm(prod(sz) * numIons), prod(sz), numIons)
mz <- sort(sample(100, numIons))
msiX <- msiDataset(x, mz, sz[1], sz[2])




