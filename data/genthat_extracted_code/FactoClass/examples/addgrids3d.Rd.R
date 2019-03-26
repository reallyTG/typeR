library(FactoClass)


### Name: addgrids3d
### Title: Add grids to a scatterplot3d
### Aliases: addgrids3d

### ** Examples

library(FactoClass)
data(cafe)
Y <- cafe[1:10 ,1:3]
Y3D <- scatterplot3d (Y, main ="Y",type="h",color ="darkblue",box=FALSE) 
Y3D$points3d(Y,pch=1)
addgrids3d(Y, grid = c("xy", "xz", "yz"))
cord2d <-Y3D$xyz.convert(Y)
text(cord2d,labels = rownames(Y),cex = 0.8,col = "blue",pos = 4) 



