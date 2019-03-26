library(SPUTNIK)


### Name: msImage
### Title: Constructor for ms.image-class objects.
### Aliases: msImage

### ** Examples

## Load package
library("SPUTNIK")

## MS image
imShape <- c(40, 50)
matIm <- matrix(rnorm(200), imShape[1], imShape[2])
im <- msImage(values = matIm, name = "random", scale = TRUE)




