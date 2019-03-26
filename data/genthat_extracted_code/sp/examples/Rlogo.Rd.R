library(sp)


### Name: Rlogo
### Title: Rlogo jpeg image
### Aliases: Rlogo gt
### Keywords: datasets

### ** Examples

## Not run: 
##D library(rgdal)
##D logo <- system.file("pictures/Rlogo.jpg", package="rgdal")[1]
##D x <- GDAL.open(logo)
##D gt = .Call('RGDAL_GetGeoTransform', x, PACKAGE="rgdal")
##D data <- getRasterData(x)
##D GDAL.close(x)
## End(Not run)
data(Rlogo)
d = dim(Rlogo)
cellsize = abs(c(gt[2],gt[6]))
cells.dim = c(d[1], d[2]) # c(d[2],d[1])
cellcentre.offset = c(x = gt[1] + 0.5 * cellsize[1], y = gt[4] - (d[2] - 0.5) * abs(cellsize[2]))
grid = GridTopology(cellcentre.offset, cellsize, cells.dim)
df = as.vector(Rlogo[,,1])
for (band in 2:d[3]) df = cbind(df, as.vector(Rlogo[,,band]))
df = as.data.frame(df)
names(df) = paste("band", 1:d[3], sep="")
Rlogo <- SpatialGridDataFrame(grid = grid, data = df)
summary(Rlogo)
spplot(Rlogo, zcol=1:3, names.attr=c("red","green","blue"), 
	col.regions=grey(0:100/100),
	main="example of three-layer (RGB) raster image", as.table=TRUE)



