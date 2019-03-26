library(DGVM3D)


### Name: establishTrees
### Title: poplulate a patch with its vegetation
### Aliases: establishTrees

### ** Examples

## Not run: 
##D dgvm3d.options("default")
##D stand = initStand(npatch=1)
##D veg = data.frame(DBH=rep(0.5, 100))
##D veg$Height    = veg$DBH * 35
##D veg$Crownarea = veg$DBH * 10
##D veg$LeafType  = sample(1:2, nrow(veg), replace=TRUE)
##D veg$ShadeType = sample(1:2, nrow(veg), replace=TRUE)
##D stand@patches[[1]]@vegetation = establishTrees(veg, stand@hexagon@supp[['inner.radius']])
##D stand3D(stand)
##D dummy = plant3D(stand)
##D rot.z = rotationMatrix(0, 0, 0, 1)
##D rot.y = rotationMatrix(0, 1, 0, 0)
##D rgl.viewpoint(userMatrix = rot.y %*% rot.z, fov=1)
##D 
##D rgl.clear()
##D dgvm3d.options(establish.method = "sunflower")
##D stand@patches[[1]]@vegetation = establishTrees(veg, stand@hexagon@supp[['inner.radius']])
##D stand3D(stand)
##D dummy = plant3D(stand)
##D 
##D rgl.clear()
##D dgvm3d.options(establish.method = "row")
##D stand@patches[[1]]@vegetation = establishTrees(veg, stand@hexagon@supp[['inner.radius']],
##D                                                jitter=TRUE, amount=0.01)
##D stand3D(stand)
##D dummy = plant3D(stand)
## End(Not run)



