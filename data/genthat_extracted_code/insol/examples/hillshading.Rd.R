library(insol)


### Name: hillshading
### Title: Intensity of illumination over a surface
### Aliases: hillshading

### ** Examples

## Not run: 
##D ## From the "Obligatory Mathematical surface" in persp3d {rgl}
##D ## this shows the cast shdows clearly, but there is some interference with rgl internal
##D ## lit parameters
##D require(rgl)
##D x = seq(-10, 10, length= 300)
##D y = x
##D f = function(x,y) { r <- sqrt(x^2+y^2); 10 * sin(r)/r }
##D z = outer(x, y, f)
##D z[is.na(z)] = 1
##D zgr = cgrad(z,2/30)
##D sv = normalvector(55,315)
##D hsh = zgr[,,1]*sv[1]+zgr[,,2]*sv[2]+zgr[,,3]*sv[3]
##D hsh = (hsh+abs(hsh))/2
##D sh = doshade(z,sv,2/30)
##D hshsh = hsh*sh
##D hshsh = t(hshsh[nrow(hshsh):1,])
##D open3d()
##D rgl.light(viewpoint.rel = F, ambient = "#FFFFFF", diffuse = "#FFFFFF", specular = "#000000")
##D persp3d(x, y, z, col=grey(hshsh))
## End(Not run)

## Hillshading on mountain terrain, sun at NW, 35 degrees elevation
zipfile = tempfile()
download.file("https://meteoexploration.com/R/insol/data/dempyrenees.asc.zip",zipfile)
header = read.table(unz(zipfile,'dempyrenees.asc'),nrows=6)
dem = read.table(unz(zipfile,'dempyrenees.asc'),skip=6)
dem = as.matrix(dem)
unlink(zipfile)
cellsize = header[5,2]
sv = normalvector(55,315)
grd = cgrad(dem,cellsize)
hsh = grd[,,1]*sv[1]+grd[,,2]*sv[2]+grd[,,3]*sv[3]
## remove negative incidence angles (self shading) 
hsh = (hsh+abs(hsh))/2
sh = doshade(dem,sv,cellsize)
hshsh = hsh*sh
image(t(hshsh[nrow(sh):1,]),col=grey(1:100/100))

## Not run: 
##D ## Hillshading on mountain terrain, sun at NW, 45 degrees elevation. Using raster
##D sv = normalvector(45,315)
##D require(rgdal)
##D require(raster)
##D demfile = tempfile()
##D download.file("https://meteoexploration.com/R/insol/data/dempyrenees.tif",demfile)
##D dem = raster(demfile)
##D grd = cgrad(dem)
##D hsh = grd[,,1]*sv[1]+grd[,,2]*sv[2]+grd[,,3]*sv[3]
##D ## remove negative incidence angles (self shading) 
##D hsh = (hsh+abs(hsh))/2
##D hsh = raster(hsh,crs=projection(dem))
##D extent(hsh) = extent(dem)
##D plot(hsh,col=grey(1:100/100),legend=FALSE)
##D unlink(demfile)
## End(Not run)




