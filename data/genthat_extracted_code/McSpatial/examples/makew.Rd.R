library(McSpatial)


### Name: makew
### Title: Calculation of spatial weight matrices
### Aliases: makew
### Keywords: Contiguity Matrix Spatial AR Model

### ** Examples

cmap <- readShapePoly(system.file("maps/CookCensusTracts.shp",
  package="McSpatial"))
cmap <- cmap[cmap$POPULATION>0&cmap$AREA>0,]
cmap <- cmap[cmap$CHICAGO==1&cmap$CAREA!="O'Hare",]
lmat <- coordinates(cmap)
fit <- makew(shpfile=cmap,method="queen")
# fit <- makew(coormat=lmat,method="ring",ringdist=1)





