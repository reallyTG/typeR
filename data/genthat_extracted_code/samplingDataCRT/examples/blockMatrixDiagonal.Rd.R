library(samplingDataCRT)


### Name: blockMatrixDiagonal
### Title: diagonal block matrix
### Aliases: blockMatrixDiagonal

### ** Examples

m1<-matrix(round(runif(4*4),1),nrow=4,ncol=4)
m2<-matrix(round(runif(4*4),1),nrow=4,ncol=4)
blockMatrixDiagonal(m1,m2,m2,m1)

sigma.1<-0.1
sigma.2<-0.4
J<-10 #subjects
I<-3 #cluster
V.i<-sigma.2*matrix(1,nrow=J,ncol=J)+sigma.1*diag(1, nrow=J,ncol=J) #Covarianmatrix of one cluster
x<-lapply(1:I, function(X) V.i)
blockMatrixDiagonal(x) #Covarianmatrix of all cluster



