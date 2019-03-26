library(SPUTNIK)


### Name: globalPeaksFilter
### Title: Reference similarity based peak selection.
### Aliases: globalPeaksFilter

### ** Examples

## Load package
library("SPUTNIK")

## Mass spectrometry intensity matrix
X <- matrix(rnorm(200), 20, 40)

## Print original dimensions
print(dim(X))

## m/z vector
mzVector <- seq(600, 900, by = (900 - 600) / 39)

## Read the image size
imSize <- c(5, 4)

## Construct the ms.dataset object
msiX <- msiDataset(X, mzVector, imSize[1], imSize[2])

## Generate the reference image and the ROI mask
ref.roi <- refAndROIimages(msiX, refMethod = "sum", roiMethod = "otsu")

## Perform global peaks filter
glob.peaks <- globalPeaksFilter(msiData = msiX, referenceImage = ref.roi$Reference,
                                method = "pearson", threshold = 0)

## Apply the filter
msiX <- applyPeaksFilter(msiX, glob.peaks)

## Print the new dimensions
print(dim(getIntensityMat(msiX)))



