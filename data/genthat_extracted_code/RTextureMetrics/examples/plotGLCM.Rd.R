library(RTextureMetrics)


### Name: plotGLCM
### Title: plot (plot GLC-Matrix)
### Aliases: plotGLCM
### Keywords: IO

### ** Examples

data<-c(0,0,1,1,0,0,1,1,0,2,2,2,2,2,3,3)
mat<-matrix(data,nrow=4, byrow=TRUE)
GLCM<-genGLCM(2,1,mat)
plotGLCM(GLCM)



