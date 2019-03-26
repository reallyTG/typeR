library(SPUTNIK)


### Name: smoothImage,ms.image-method
### Title: Apply Gaussian smoothing to an MS image.
### Aliases: smoothImage,ms.image-method smoothImage

### ** Examples

## Load package
library("SPUTNIK")

## Create ms.image-class object
msIm <- msImage(values = matrix(rnorm(200), 40, 50), name = "test", scale = TRUE)

## Smooth the image colors
msImSmoothed <- smoothImage(msIm, sigma = 5)



