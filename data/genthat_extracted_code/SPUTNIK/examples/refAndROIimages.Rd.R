library(SPUTNIK)


### Name: refAndROIimages
### Title: Compute the reference image and the ROI mask.
### Aliases: refAndROIimages

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

## Calculate the reference and ROI images from the ms.dataset-class object msiX.
## The reference is calculated as the first principal component scores scaled
## in [0, 1]; the binary ROI is calculated applying k-means on the entire dataset.
## Use only m/z values in the range of [700, 900]. The interval extremal values
## are matched within a tolerance of 50 ppm.

ref.roi <- refAndROIimages(msiData = msiX, refMethod = "sum",
                           roiMethod = "otsu", useFullMZRef = TRUE)

## Plot the reference and region of interest ROI
## plot(ref.roi$Reference)
## plot(ref.roi$ROI)



