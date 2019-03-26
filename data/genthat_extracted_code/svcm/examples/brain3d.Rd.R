library(svcm)


### Name: brain3d
### Title: Three-dimensional Diffusion Weighted Dataset
### Aliases: brain3d
### Keywords: datasets

### ** Examples

data(brain3d)
dim(brain3d)
old.par <- par(no.readonly = TRUE) 
par(pin=c(1.1, 3.4), mfrow=c(1, 6))
for (i in 1:dim(brain3d)[4])
  image(matrix(aperm(brain3d[,,,i], c(2,1,3)), nrow=dim(brain3d)[2]),
        axes=FALSE, col=grey.colors(256), main=paste("DWI", i))
title("6 DWIs of a (15 x 30 x 6) human brain extract in axial view",
      outer=TRUE, line=-10) 
par(old.par)



