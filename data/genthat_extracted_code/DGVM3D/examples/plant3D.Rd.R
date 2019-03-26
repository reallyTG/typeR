library(DGVM3D)


### Name: plant3D
### Title: Plant the trees of an already created patch/stand
### Aliases: plant3D

### ** Examples

## Not run: 
##D stand = initStand(npatch=2)
##D stand3D(stand, 1)
##D veg = data.frame(DBH=rep(0.4, 50))
##D veg$Height    = veg$DBH * 35
##D veg$Crownarea = veg$DBH * 5
##D veg$LeafType  = sample(1:2, nrow(veg), replace=TRUE)
##D veg$ShadeType = sample(1:2, nrow(veg), replace=TRUE)
##D stand@patches[[1]]@vegetation = establishTrees(veg, stand@hexagon@supp[['inner.radius']])
##D dummy = plant3D(stand, 1)
##D 
##D stand3D(stand, 2)
##D veg = data.frame(DBH=rep(0.5, 100) * rgamma(100, 2.5, 9))
##D veg$Height    = veg$DBH * 35  * rbeta(nrow(veg),10,1)
##D veg$Crownarea = veg$DBH * 5 * rnorm(nrow(veg), 1, 0.1)
##D veg$LeafType  = sample(1:2, nrow(veg), replace=TRUE)
##D veg$ShadeType = sample(1:2, nrow(veg), replace=TRUE)
##D stand@patches[[2]]@vegetation = establishTrees(veg, stand@hexagon@supp[['inner.radius']])
##D dummy = plant3D(stand, 2)
## End(Not run)



