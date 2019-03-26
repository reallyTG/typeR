library(voxel)


### Name: ts2matrix
### Title: Timeseries to Matrix
### Aliases: ts2matrix
### Keywords: internal

### ** Examples



image <- oro.nifti::nifti(img = array(1:64, dim =c(4,4,4,5)))
mask <- oro.nifti::nifti(img = array(0:1, dim = c(4,4,4)))
matrix <- ts2matrix(image, mask)



