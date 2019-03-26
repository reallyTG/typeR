library(voxel)


### Name: ts2meanCluster
### Title: Timeseries to Mean Cluster
### Aliases: ts2meanCluster
### Keywords: internal

### ** Examples



image <- oro.nifti::nifti(img = array(1:320, dim =c(4,4,4,5)))
mask <- oro.nifti::nifti(img = array(0:15, dim = c(4,4,4,1)))
matrix <- ts2meanCluster(image, mask)



