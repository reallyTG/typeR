library(Anthropometry)


### Name: HartiganShapes
### Title: Hartigan-Wong k-means for 3D shapes
### Aliases: HartiganShapes
### Keywords: array

### ** Examples

#CLUSTERING INDIVIDUALS ACCORDING TO THEIR SHAPE:
landmarksNoNa <- na.exclude(landmarksSampleSpaSurv)
dim(landmarksNoNa) 
#[1] 574 198 
numLandmarks <- (dim(landmarksNoNa)[2]) / 3
#[1] 66
#As a toy example, only the first 20 individuals are used.
landmarksNoNa_First20 <- landmarksNoNa[1:20, ] 
(numIndiv <- dim(landmarksNoNa_First20)[1])
#[1] 20         
    
array3D <- array3Dlandm(numLandmarks, numIndiv, landmarksNoNa_First20)
array3D <- array3D[1:10,,] #to reduce computational times.
#shapes::plotshapes(array3D[,,1]) 
#calibrate::textxy(array3D[,1,1], array3D[,2,1], labs = 1:numLandmarks, cex = 0.7) 
 
numClust <- 3 ; algSteps <- 1 ; niter <- 1 ; stopCr <- 0.0001
set.seed(2013)
resHA <- HartiganShapes(array3D, numClust, algSteps, niter, stopCr, FALSE, FALSE, c(), FALSE)

asig <- resHA$ic1  #table(asig) shows the clustering results.
prototypes <- anthrCases(resHA)

#Note: For a simulation study, see www.uv.es/vivigui/softw/more_examples.R 



