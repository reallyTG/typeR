library(SPUTNIK)


### Name: plot,ms.image,missing-method
### Title: Visualize an MS image. 'plot' extends the generic function to
###   ms.image-class objects.
### Aliases: plot,ms.image,missing-method plot

### ** Examples

## Load package
library("SPUTNIK")

## Create ms.image-class object
msIm <- msImage(values = matrix(rnorm(200), 40, 50), name = "test", scale = TRUE)

## Plot the image
## plot(msIm)



