library(hsdar)


### Name: distMat3D
### Title: Methods to create, manipulate and query objects of class
###   'DistMat3D'.
### Aliases: distMat3D show,DistMat3D-method as.array,DistMat3D-method
###   as.matrix,DistMat3D-method dim,DistMat3D-method ncol,DistMat3D-method
###   nrow,DistMat3D-method distMat3D,matrix-method
###   distMat3D,numeric-method distMat3D,array-method [,DistMat3D-method
###   [,DistMat3D,ANY,ANY-method [,DistMat3D,ANY,ANY,ANY-method
###   [<-,DistMat3D-method [<-,DistMat3D,ANY,ANY-method
###   [<-,DistMat3D,ANY,ANY,ANY-method <,DistMat3D,ANY-method
###   <=,DistMat3D,ANY-method >,DistMat3D,ANY-method
###   >=,DistMat3D,ANY-method ==,DistMat3D,ANY-method
###   <,DistMat3D,DistMat3D-method <=,DistMat3D,DistMat3D-method
###   >,DistMat3D,DistMat3D-method >=,DistMat3D,DistMat3D-method
###   ==,DistMat3D,DistMat3D-method <,ANY,DistMat3D-method
###   <=,ANY,DistMat3D-method >,ANY,DistMat3D-method
###   >=,ANY,DistMat3D-method ==,ANY,DistMat3D-method
### Keywords: classes

### ** Examples

data(spectral_data)

## Mask channel crossing part (around 1050 nm) and strong 
## water absorption part (above 1350 nm)
mask(spectral_data) <- c(1045, 1055, 1350, 1706)

## Calculate SAM distances (object of class 'dist')
sam_dist <- dist.speclib(subset(spectral_data, season == "summer"))

## Convert to class 'distMat3D'
sam_dist <- distMat3D(as.matrix(sam_dist))

## Default print of DistMat3D-object
sam_dist

## Convert back to matrix
as.matrix(sam_dist)

## Get number of rows and samples
dim(sam_dist)

## Compare values in DistMat3D-object
small_dists <- sam_dist < 0.02

## Convert small_dists-object to DistMat3D
distMat3D(as.numeric(small_dists), 15, 1)



