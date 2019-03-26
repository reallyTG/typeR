library(oceanmap)


### Name: get.bathy
### Title: Returns bathymetric data from the NOAA ETOPO1 database as
###   RasterLayer, given coordinate bounds and resolution.
### Aliases: get.bathy
### Keywords: bathymetry image plot

### ** Examples


## Example 1: load & plot bathymetry of the Baltic Sea, defined by longitudes and latidtues
lon <- c(9, 31)
lat <- c(53.5, 66)
# get.bathy(lon=lon, lat=lat, main="Baltic Sea", cbpos='r')

## Example 2: plot bathymetry using a v_area-keyword
#get.bathy("lion",res=4, keep=T) # can take some time, requires server connection!
#get.bathy("lion",res=1, keep=T,visualize=FALSE)

## Example 3: plot landmask of the Baltic Sea defined by an extent- or raster-object
library('raster')
ext <- extent(lon,lat)
#get.bathy(ext,visualize=T,main="Baltic Sea",res=4,levels=200) # extent-object

## Example 4: plot bathymetry and topography of the western Mediterranean Sea
### a) download, assign and save bathymetry
# bathy <- get.bathy("medw4",visualize=F,terrain=T,res=3,keep=T)
# # load('bathy_medw4_res.3.dat',verbose = T); bathy <- h
# par(mfrow=c(2,1))
# v(bathy,param="bathy",subplot = T)
# get.bathy("medw4",visualize=T,terrain=F,res=3,levels=c(200,2000), 
# subplot = T,grid=F) # show contours

### b) only contour lines:
# par(mfrow=c(1,2))
# h <- get.bathy("lion",visualize=T,terrain=F,res=3,levels=c(200,2000),
#                v_image=F, subplot=T,grid=F)

### use v-function for same plot but on subregion:
# v(h,v_area = "survey", param="bathy",subplot = T, v_contour = T, 
#   v_image = F, levels=c(200,2000)) 




