library(GSIF)


### Name: sample.grid
### Title: sample spatial points by grids
### Aliases: sample.grid sample.grid.SpatialPoints
###   sample.grid.SpatialPointsDataFrame sample.grid,SpatialPoints-method
###   sample.grid,SpatialPointsDataFrame-method
### Keywords: methods

### ** Examples

library(sp)
data(isis)
profs <- isis[["sites"]]
coordinates(profs) <- ~  LONWGS84 + LATWGS84
proj4string(profs) <- CRS("+proj=longlat +datum=WGS84")
## sample SpatialPointsDataFrame: 
#bbox <- matrix(c(-180, -90, 180, 90), nrow=2)
prof1 <- sample.grid(profs, cell.size = c(5,5), n = 1)
l0 <- list("sp.points", profs, pch=1, col="red")
l1 <- list("sp.points", prof1$subset, pch="+", col="black", cex=1.2)
spplot(prof1$grid, scales=list(draw=TRUE), 
   col.regions="grey", sp.layout=list(l0, l1))
## Subsampling ratio:
round(length(prof1$subset)/length(profs)*100, 1)



