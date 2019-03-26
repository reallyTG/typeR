library(VoxR)


### Name: obj.rec
### Title: Spatially differentiated objects recognition
### Aliases: obj.rec
### Keywords: 3d objets 3d points cloud

### ** Examples

data(data_part)

#- voxelisation
data_vox <- vox(data_part,res=1)

#- objects reconuition

datasep <- obj.rec(data_vox,fac=2)


#-visualisation

require(rgl)
library(rgl)
open3d()
b <- subset(datasep,datasep[,4]==1)
plot3d(b,col="green",add=TRUE)
c <- subset(datasep,datasep[,4]==2)
plot3d(c,col="red",add=TRUE)
e <- subset(datasep,datasep[,4]==3)
plot3d(e,col="blue",add=TRUE)
f <- subset(datasep,datasep[,4]==4)
plot3d(f,col="purple",add=TRUE)



