library(SPUTNIK)


### Name: splitPeaksFilter
### Title: Test for the presence of split peaks.
### Aliases: splitPeaksFilter

### ** Examples

## Load package
library("SPUTNIK")

## Mass spectrometry intensity matrix
X <- matrix(rnorm(200), 20, 40)

## Print original dimensions
print(dim(X))

## m/z vector
mzVector <- seq(600, 601, by = (601 - 600) / 39)

## Read the image size
imSize <- c(5, 4)

## Construct the ms.dataset object
msiX <- msiDataset(X, mzVector, imSize[1], imSize[2])

## Determine split peaks
sp.filter <- splitPeaksFilter(msiData = msiX, mzTolerance = 50,
                              sharedPixelsRatio = 0,
                              sparseness = "spatial.chaos", threshold = 0.5)



