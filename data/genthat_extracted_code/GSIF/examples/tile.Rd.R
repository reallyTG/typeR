library(GSIF)


### Name: tile
### Title: Tiles (subsets or clips) a spatial object to regular blocks
### Aliases: tile tile,SpatialPixelsDataFrame-method
###   tile,SpatialPointsDataFrame-method tile,SpatialLinesDataFrame-method
###   tile,SpatialPolygonsDataFrame-method tile,RasterLayer-method
### Keywords: methods

### ** Examples

## spatial pixels:
library(sp)
data(meuse.grid)
gridded(meuse.grid) <- ~x+y
tl <- getSpatialTiles(meuse.grid, block.x=1000)
image(meuse.grid)
lines(as(tl, "SpatialLines"))
## all at once:
pix.lst <- tile(meuse.grid, block.x=1000)
## Not run: 
##D ## lines:
##D library(plotKML)
##D data(eberg_contours)
##D line.lst <- tile(eberg_contours, block.x=5000)
##D spplot(line.lst[[1]][2])
##D ## polygons:
##D data(eberg_zones)
##D ## this one requires ogr2ogr function:
##D pol.lst <- tile(eberg_zones, block.x=5000)
##D spplot(pol.lst[[1]][1])
##D ## raster files via rgdal:
##D library(rgdal)
##D fn = system.file("pictures/SP27GTIF.TIF", 
##D  package = "rgdal")
##D obj <- GDALinfo(fn)
##D ras.lst <- getSpatialTiles(obj, block.x=1000)
##D offset <- c(ras.lst$offset.y[1], ras.lst$offset.x[1])
##D region.dim <- c(ras.lst$region.dim.y[1], 
##D   ras.lst$region.dim.x[1])
##D ## read the first tile:
##D SP27GTIF_T1 <- readGDAL(fn, offset=offset, 
##D   region.dim=region.dim)
##D str(SP27GTIF_T1)
## End(Not run)



