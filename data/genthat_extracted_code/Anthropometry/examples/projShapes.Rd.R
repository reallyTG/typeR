library(Anthropometry)


### Name: projShapes
### Title: Helper function for plotting the shapes
### Aliases: projShapes
### Keywords: math

### ** Examples

landmarksNoNa <- na.exclude(landmarksSampleSpaSurv)
dim(landmarksNoNa) 
#[1] 574 198 
numLandmarks <- (dim(landmarksNoNa)[2]) / 3
#[1] 66
#As a toy example, only the first 15 individuals are used.
landmarksNoNa_First10 <- landmarksNoNa[1:10, ] 
(numIndiv <- dim(landmarksNoNa_First10)[1])
#[1] 10         
    
array3D <- array3Dlandm(numLandmarks, numIndiv, landmarksNoNa_First10)
#shapes::plotshapes(array3D[,,1]) 
#calibrate::textxy(array3D[,1,1], array3D[,2,1], labs = 1:numLandmarks, cex = 0.7) 

numClust <- 2 ; algSteps <- 1 ; niter <- 1 ; stopCr <- 0.0001
resLL <- LloydShapes(array3D, numClust, algSteps, niter, stopCr, FALSE, FALSE)
clust_kmeansProc <- resLL$asig

prototypes <- anthrCases(resLL)

projShapes(1, array3D, clust_kmeansProc, prototypes)
#legend("topleft", c("Registrated data", "Mean shape"), pch = 1, col = 1:2, text.col = 1:2)
#title("Procrustes registrated data for cluster 1 \n with its mean shape superimposed", 
#      sub = "Plane xy")



