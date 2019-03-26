library(VoxR)


### Name: sub.obj
### Title: Substraction of two voxel coulds
### Aliases: sub.obj
### Keywords: 3d points clouds substraction 3d points clouds

### ** Examples

#- importing 2 data dets
data(data1)
data(data2)

#- substraction of data2 to data1

sub <- sub.obj(data1,data2,res=0.5,nvox.reaserch=1)

#-visualisation

require(rgl)
library(rgl)
open3d()
plot3d(sub,col="red",add=TRUE)
plot3d(data2,add=TRUE)



