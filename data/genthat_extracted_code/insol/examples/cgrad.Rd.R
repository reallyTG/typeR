library(insol)


### Name: cgrad
### Title: Normal vector to every grid cell in a DEM
### Aliases: cgrad

### ** Examples

## visualize x, y z components of vector normal to a DEM representing a regular pyramid
m = matrix(0,nrow=100,ncol=100)
for (i in 1:100){ for (j in 1:100){
m[i,j]=50-max(abs(i-50),abs(j-50)) }}
grdm = cgrad(m,1)
xcomponent = grdm[,,1]
ycomponent = grdm[,,2]
zcomponent = grdm[,,3]
image(t(xcomponent[nrow(xcomponent):1,]) ,col=grey(1:10/10))
image(t(ycomponent[nrow(ycomponent):1,]) ,col=grey(1:10/10))
image(t(zcomponent[nrow(zcomponent):1,]) ,col=grey(1:10/10))


## Surface area of every grid cell in a mountain region
## Steep slopes correspond to larger surface area per grid cell
zipfile = tempfile()
download.file("https://meteoexploration.com/R/insol/data/dempyrenees.asc.zip",zipfile)
header = read.table(unz(zipfile,'dempyrenees.asc'),nrows=6)
dem = read.table(unz(zipfile,'dempyrenees.asc'),skip=6)
dem = as.matrix(dem)
unlink(zipfile)
cellsize = header[5,2]
grdarea = cgrad(dem,cellsize,cArea=TRUE)
image(t(grdarea[nrow(grdarea):1,]),col=grey(100:1/100))

## plot the relationship between surface slope and surface area per grid cell:
slpg = slope(cgrad(dem,cellsize),degrees=TRUE)
plot(slpg,grdarea)

## This would be a linear relationship in 2D, 
## but in a DEM the slope of the grid cell depends on 4 points in 3D
plot(tan(radians(slpg)),grdarea)

## Not run: 
##D ## Use raster for better display and keep the dem projection
##D require(rgdal)
##D require(raster)
##D demfile = tempfile()
##D download.file("https://meteoexploration.com/R/insol/data/dempyrenees.tif",demfile)
##D dem = raster(demfile)
##D plot(dem)
##D grd = cgrad(dem)
##D grdarea = cgrad(dem,cArea=TRUE)
##D rgrdarea = raster(grdarea,crs=projection(dem))
##D extent(rgrdarea) = extent(dem)
##D plot(rgrdarea,col = grey(100:1/100))
##D contour(dem,col='sienna1',lwd=.5,nlevels=30,add=TRUE)
##D unlink(demfile)
## End(Not run)




