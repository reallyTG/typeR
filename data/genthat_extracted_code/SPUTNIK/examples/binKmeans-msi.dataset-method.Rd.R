library(SPUTNIK)


### Name: binKmeans,msi.dataset-method
### Title: Return a binary mask generated applying k-means clustering on
###   peaks intensities.
### Aliases: binKmeans,msi.dataset-method binKmeans

### ** Examples

## Load package
library("SPUTNIK")

## Create the msi.dataset-class object
sz <- c(5, 4)
x <- matrix(rnorm(sz[1] * sz[2] * 20), sz[1]*sz[2], 20)
mz <- sort(sample(100, ncol(x)))
msiX <- msiDataset(x, mz, sz[1], sz[2])

## Binarize the reference image
refBin <- binKmeans(msiX)

## Plot the binarized reference
plot(refBin)



