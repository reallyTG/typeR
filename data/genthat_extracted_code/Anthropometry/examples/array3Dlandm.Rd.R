library(Anthropometry)


### Name: array3Dlandm
### Title: Helper function for the 3D landmarks
### Aliases: array3Dlandm
### Keywords: math

### ** Examples

landmarksNoNa <- na.exclude(landmarksSampleSpaSurv)
numLandmarks <- (dim(landmarksNoNa)[2]) / 3
landmarksNoNa_First50 <- landmarksNoNa[1:50, ]
numIndiv <- dim(landmarksNoNa_First50)[1]

array3D <- array3Dlandm(numLandmarks, numIndiv, landmarksNoNa_First50)



