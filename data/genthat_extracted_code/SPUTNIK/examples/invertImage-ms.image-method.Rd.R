library(SPUTNIK)


### Name: invertImage,ms.image-method
### Title: Invert the colors of an MS image.
### Aliases: invertImage,ms.image-method invertImage

### ** Examples

## Load package
library("SPUTNIK")

## Create ms.image-class object
msIm <- msImage(values = matrix(rnorm(200), 40, 50), name = "test", scale = TRUE)

## Invert the colors
msImInverted <- invertImage(msIm)



