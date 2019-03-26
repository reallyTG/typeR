library(SPUTNIK)


### Name: closeImage,ms.image-method
### Title: Apply morphological closing to binary image.
### Aliases: closeImage,ms.image-method closeImage

### ** Examples

## Load package
library("SPUTNIK")

## Create ms.image-class object
msIm <- msImage(values = matrix(rnorm(200), 40, 50), name = "test", scale = TRUE)

## Generate binary image
msImBin <- binOtsu(msIm)

## Apply the morphological closing
msImClosed <- closeImage(msImBin, kern.size = 3)



