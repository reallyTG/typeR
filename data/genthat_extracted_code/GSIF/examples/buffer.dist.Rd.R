library(GSIF)


### Name: buffer.dist-methods
### Title: Derive buffer distances to a set of points
### Aliases: buffer.dist
###   buffer.dist,SpatialPointsDataFrame,SpatialPixelsDataFrame-method

### ** Examples

library(sp)
library(raster)
library(gstat)
library(randomForest)
library(quantregForest)
library(plotKML)
library(scales)
library(ranger)

## Load the Meuse data set:
demo(meuse, echo=FALSE)

## Not run: 
##D ## Soil organic matter (distance from any to all points):
##D grid.dist0 <- buffer.dist(meuse["om"], meuse.grid[1], as.factor(1:nrow(meuse)))
##D dn0 <- paste(names(grid.dist0), collapse="+")
##D fm0 <- as.formula(paste("om ~", dn0))
##D m0 <- fit.gstatModel(meuse, fm0, grid.dist0, 
##D     method="ranger", rvgm=NULL)
##D rk.m0 <- predict(m0, grid.dist0)
##D plot(rk.m0)
##D dev.off()
##D x = importance(m0@regModel)
##D plot(x)
##D ## not always most practical to calculate distance to each point
## End(Not run)

## Soil organic matter with breaks:
classes <- cut(meuse$om, breaks=seq(0, 17, length=8))
## are these optimal splits?
grid.dist <- buffer.dist(meuse["om"], meuse.grid[1], classes)
plot(stack(grid.dist))
## quantregForest as a 'replacement' for kriging:
dn <- paste(names(grid.dist), collapse="+")
fm <- as.formula(paste("om ~", dn))
m <- fit.gstatModel(meuse, fm, grid.dist, 
    method="quantregForest", rvgm=NULL)
plot(m)
dev.off()
## Residual variogram shows no spatial structure
rk.m <- predict(m, grid.dist)
plot(rk.m)
dev.off()
## prediction error:
plot(sqrt(raster(rk.m@predicted[2])))
points(meuse, pch="+")
## Not run: 
##D plotKML(rk.m@predicted["om"], colour_scale = SAGA_pal[[1]])
##D kml(meuse, file.name="om_points.kml", colour=om, labels=meuse$om)
##D kml_View("om_points.kml")
##D meuse$classes <- classes
##D plotKML(meuse["classes"])
## End(Not run)

## Not run: 
##D ## Combining geographical and feature space covariates:
##D meuse.gridT <- meuse.grid
##D meuse.gridT@data <- cbind(meuse.grid@data, grid.dist@data)
##D fm1 <- as.formula(paste("om ~", dn, "+soil+dist+ffreq"))
##D m1 <- fit.gstatModel(meuse, fm1, meuse.gridT, 
##D      method="quantregForest", rvgm=NULL)
##D ## no need to fit variogram in this case
##D plot(m1)
##D dev.off()
##D rk.m1 <- predict(m1, meuse.gridT)
##D plot(rk.m1)
##D varImpPlot(m1@regModel)
##D dev.off()
##D plotKML(rk.m1@predicted["om"], 
##D    file.name="rk_combined.kml", 
##D    colour_scale = SAGA_pal[[1]])
## End(Not run)

## Not run: 
##D ## Example with zinc:
##D classes2 <- cut(meuse$zinc, 
##D    breaks=seq(min(meuse$zinc), max(meuse$zinc), length=10))
##D grid.dist2 <- buffer.dist(meuse["zinc"], meuse.grid[1], classes2)
##D dn2 <- paste(names(grid.dist2), collapse="+")
##D meuse.gridT2 <- meuse.grid
##D meuse.gridT2@data <- cbind(meuse.grid@data, grid.dist2@data)
##D fm2 <- as.formula(paste("zinc ~", dn2, "+soil+dist+ffreq"))
##D m2 <- fit.gstatModel(meuse, fm2, meuse.gridT2, 
##D       method="quantregForest", rvgm=NULL)
##D varImpPlot(m2@regModel)
##D rk.m2 <- predict(m2, meuse.gridT2)
##D plot(rk.m2)
##D dev.off()
##D ## prediction error:
##D plot(raster(rk.m2@predicted[2]))
##D plotKML(rk.m2@predicted["zinc"], 
##D     file.name="rk_combined_zinc.kml", 
##D     colour_scale = SAGA_pal[[1]])
##D kml(meuse, colour=zinc, 
##D     file.name="zinc_points.kml", labels=meuse$zinc)
##D kml_View("zinc_points.kml")
## End(Not run)



