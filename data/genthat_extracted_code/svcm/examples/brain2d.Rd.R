library(svcm)


### Name: brain2d
### Title: Two-dimensional Diffusion Weighted Dataset
### Aliases: brain2d
### Keywords: datasets

### ** Examples

data(brain2d)
dim(brain2d)
old.par <- par(no.readonly=TRUE)
par(pin=c(6, 1.2))
image(t(matrix(brain2d, dim(brain2d)[1], dim(brain2d)[2]*6)), axes=FALSE,
      col=grey.colors(256))
title("Six Diffusion Weighted Images")
par(old.par)  



