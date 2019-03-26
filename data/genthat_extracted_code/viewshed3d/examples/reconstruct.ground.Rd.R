library(viewshed3d)


### Name: reconstruct.ground
### Title: Reconstruct the missing portions of a TLS scene's ground
### Aliases: reconstruct.ground

### ** Examples


library(viewshed3d)
data(TLSclass)
ground=subset(TLSclass,TLSclass[,4]=='ground')
reconstructed=reconstruct.ground(ground,grid.res = 0.2)

library(rgl)
open3d()
plot3d(reconstructed,add=TRUE)




