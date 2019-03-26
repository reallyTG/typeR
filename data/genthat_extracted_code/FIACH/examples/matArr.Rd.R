library(FIACH)


### Name: matArr
### Title: Matrix to Array Transformation.
### Aliases: matArr

### ** Examples


mat<-matrix(nrow=50,ncol=30*30*15)  
arr<-matArr(mat,dim=c(30,30,15,50))
dim(arr)




