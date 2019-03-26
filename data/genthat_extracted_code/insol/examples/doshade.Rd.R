library(insol)


### Name: doshade
### Title: Cast shadows
### Aliases: doshade

### ** Examples


# define the sun vector: northwest at 15 degrees elevation
sv = normalvector(75,315)

## create a pyramid 100 units by side and 50 nunits tall
m = matrix(0,nrow=100,ncol=100)
for (i in 1:100){ for (j in 1:100){
m[i,j] = 50-max(abs(i-50),abs(j-50)) }}

## place it on a large flat expanse
mm = matrix(0,nrow=500,ncol=500)
mm[201:300,201:300] = m

## calulate and plot the cast shadows from the sun 
sh = doshade(mm,sv,1)
image(t(sh[nrow(sh):1,]),col=grey(1:100/100))
contour(mm,add=TRUE,col='sienna1',nlevels=25)
## (mm is symmetrical, no need to rotate as for shadows)

## plot cast shadows on mountain terrain, sun at NW, 25 degrees elevation
zipfile = tempfile()
download.file("https://meteoexploration.com/R/insol/data/dempyrenees.asc.zip",zipfile)
header = read.table(unz(zipfile,'dempyrenees.asc'),nrows=6)
dem = read.table(unz(zipfile,'dempyrenees.asc'),skip=6)
dem = as.matrix(dem)
unlink(zipfile)
cellsize=header[5,2]
sv = normalvector(65,315)
sh = doshade(dem,sv,cellsize)
image(t(sh[nrow(sh):1,]),col=grey(1:100/100))

## add intensity of illumination in this case sun at NW 45 degrees elevation
sv = normalvector(45,315)
grd = cgrad(dem,cellsize)
hsh = grd[,,1]*sv[1]+grd[,,2]*sv[2]+grd[,,3]*sv[3]
## remove negative incidence angles (self shading) 
hsh = (hsh+abs(hsh))/2
sh = doshade(dem,sv,cellsize)
hshsh = hsh*sh
image(t(hshsh[nrow(sh):1,]),col=grey(1:100/100))


## Not run: 
##D ## plot cast shadows on mountain terrain using raster
##D sv = normalvector(65,315)
##D require(rgdal)
##D require(raster)
##D demfile = tempfile()
##D download.file("https://meteoexploration.com/R/insol/data/dempyrenees.tif",demfile)
##D dem = raster(demfile)
##D sh = doshade(dem,sv)
##D plot(sh,col=grey(0:1),legend=FALSE)
##D contour(dem,add=TRUE,col='sienna1',lwd=.5,nlevels=50)
##D 
##D ## add intensity of illumination in this case sun at NW 45 degrees elevation
##D sv = normalvector(45,315)
##D grd = cgrad(dem)
##D hsh = grd[,,1]*sv[1]+grd[,,2]*sv[2]+grd[,,3]*sv[3]
##D ## remove negative incidence angles (self shading) 
##D hsh = (hsh+abs(hsh))/2
##D ## convert back to raster as dem and add shadows
##D hsh = raster(hsh,crs=projection(dem))
##D extent(hsh) = extent(dem)
##D sh = doshade(dem,sv)
##D plot(hsh*sh,col=grey(1:100/100),legend=FALSE)
##D unlink(demfile) 
## End(Not run)




