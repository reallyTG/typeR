library(Anthropometry)


### Name: trimmOutl
### Title: Helper generic function for obtaining the trimmed and outlier
###   observations
### Aliases: trimmOutl trimmOutl.default trimmOutl.trimowa
###   trimmOutl.hipamAnthropom
### Keywords: math

### ** Examples

#CLUSTERING INDIVIDUALS ACCORDING TO THEIR SHAPE:
landmarksNoNa <- na.exclude(landmarksSampleSpaSurv)
dim(landmarksNoNa) 
#[1] 574 198 
numLandmarks <- (dim(landmarksNoNa)[2]) / 3
#[1] 66
#As a toy example, only the first 10 individuals are used.
landmarksNoNa_First10 <- landmarksNoNa[1:10, ] 
(numIndiv <- dim(landmarksNoNa_First10)[1])
#[1] 10         
    
array3D <- array3Dlandm(numLandmarks, numIndiv, landmarksNoNa_First10)

numClust <- 2 ; alpha <- 0.01 ; algSteps <- 1 ; niter <- 1 ; stopCr <- 0.0001
set.seed(2013)
res_kmeansProc <- trimmedLloydShapes(array3D, numIndiv, alpha, numClust, 
                                     algSteps, niter, stopCr, FALSE)

trimmed <- trimmOutl(res_kmeansProc)



