library(viewshed3d)


### Name: ground.filter
### Title: Additionnal filters after first ground and vegetation
###   segmentation
### Aliases: ground.filter

### ** Examples

library(viewshed3d)
data(TLSclass)

ground=subset(TLSclass,TLSclass[,4]=='ground')
resegmented=ground.filter(ground)

ground = subset(resegmented,resegmented[,4]=='ground')
vegetation = subset(resegmented,resegmented[,4]=='reclass to veg.')

library(rgl)
open3d()
plot3d(ground,col="brown",add=TRUE)
plot3d(vegetation,col="darkgreen",add=TRUE)



