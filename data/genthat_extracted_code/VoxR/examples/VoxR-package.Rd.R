library(VoxR)


### Name: VoxR-package
### Title: Metrics extraction of trees from T-LiDAR data
### Aliases: VoxR-package VoxR
### Keywords: package 3d point cloud LiDAR

### ** Examples

data(treecloud)

#-voxelisation using the vox function

treecloud_vox <- vox(treecloud,res=0.02)

#-visualisation

require(rgl)
library(rgl)
open3d()
plot3d(treecloud_vox,size=0.1)



