library(Anthropometry)


### Name: trimmedLloydShapes
### Title: Trimmed Lloyd k-means for 3D shapes
### Aliases: trimmedLloydShapes
### Keywords: array

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
res <- trimmedLloydShapes(array3D, numIndiv, alpha, numClust, 
                          algSteps, niter, stopCr, FALSE)

#Optimal partition and prototypes:
clust <- res$asig 
table(clust)
prototypes <- anthrCases(res)

#Trimmed individuals:
trimmed <- trimmOutl(res)



