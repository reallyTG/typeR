library(RTextureMetrics)


### Name: RTextureMetrics-package
### Title: Calculation of texture metrics for Grey Level Co-occurrence
###   matrices
### Aliases: RTextureMetrics-package RTextureMetrics
### Keywords: package

### ** Examples

data<-c(0,0,1,1,0,0,1,1,0,2,2,2,2,2,3,3)
mat<-matrix(data, nrow=4, byrow=TRUE)
(mat)
GLCM<-genGLCM(2,1,mat)
(GLCM)
calcCON(GLCM)
calcHOM(GLCM)
calcDIS(GLCM)
calcASM(GLCM)
calcENT(GLCM)
findMaxPropability(GLCM)
plotGLCM(GLCM)



