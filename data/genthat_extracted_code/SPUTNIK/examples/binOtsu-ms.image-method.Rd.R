library(SPUTNIK)


### Name: binOtsu,ms.image-method
### Title: Binarize MS image using Otsu's thresholding.
### Aliases: binOtsu,ms.image-method binOtsu

### ** Examples

## Load package
library("SPUTNIK")

## Create ms.image-class object
msIm <- msImage(values = matrix(rnorm(200), 40, 50), name = "test", scale = TRUE)

## Generate binary image
binIm <- binOtsu(msIm)



