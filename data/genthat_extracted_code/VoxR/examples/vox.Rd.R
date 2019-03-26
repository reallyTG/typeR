library(VoxR)


### Name: vox
### Title: Voxelisation
### Aliases: vox
### Keywords: 3d points cloud voxelisation

### ** Examples

#-import data

data(treecloud)

#-voxelisation

treecloud_vox <- vox(treecloud,res=0.02)

#-visualisation

require(rgl)
library(rgl)
open3d()
plot3d(treecloud_vox,size=0.1)



