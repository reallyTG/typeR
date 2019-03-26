library(oceanmap)


### Name: v
### Title: Plotting spatial data
### Aliases: v v.plot v.bathy v.gz v.raster v,bathy-method
###   v,RasterBrick-method v,RasterLayer-method v,RasterStack-method
###   v,character-method v,gz-method v,nc-method v,ncdf4-method
### Keywords: bathymetry image plot

### ** Examples

################## simple example section:

## Example 1: load & plot a sample Raster-object
path <- system.file("test_files", package="oceanmap")
load(paste0(path,"/medw4_modis_sst2_4km_1d_20020705_20020705.r2010.0.qual0.Rdata"),verbose=TRUE)
dat <- raster::crop(dat,extent(c(0,10,40,44))) ## crop data, xlim/ylim not yet implemented in v()
print(dat)
v(dat, main="Raster-object", cbpos='r')


## Example 2: load & plot sample netcdf-file ('.nc'-file)
nfiles <- Sys.glob(paste0(path,'/*.nc')) # load list of sample-'.nc'-files
head(nfiles)

### option a) load netcdf-file with ncdf4-package and plot it
library('ncdf4')
ncdf <- nc_open(nfiles[1])
# print(ncdf)
# v(obj = ncdf, cbpos="r")

### option b) load and plot netcdf-file as RasterStack object
# nc <- nc2raster(nfiles[1])
# v(nc,cbpos="r") # plot RasterStack object

### option c) plot netcdf-file directly
# v(nfiles[1], cbpos="r")
# v(nfiles[1], cbpos="r", replace.na=TRUE)

###### plot multiple layers:
# par(mfrow=c(2,2))
# v(nfiles[1], t=1:4, cbpos="r", replace.na=TRUE, subplot = TRUE)


# ## Example 2: load & plot bathymetry data from the NOAA-ETOPO1 database
# par(mfrow=c(2,1))
# bathy <- get.bathy("medw4", terrain=T, res=3, keep=T, visualize=T, subplot = TRUE, grid=F)
# # load('bathy_medw4_res.3.dat',verbose = T); bathy <- h
# v(bathy, param="bathy", subplot = TRUE, terrain=F, levels=c(200,2000)) # show contours
# 
# ## b) only contour lines:
# par(mfrow=c(1,2))
# h <- get.bathy("lion",terrain=F,res=3, visualize=T,
#                subplot=T, v_image = FALSE, levels=c(200,2000))
# 
# ## use v-function for same plot but on subregion:
# v(h,v_area = "survey", param="bathy",
#   subplot=T, v_image = FALSE, levels=c(200,2000)) 


## Example 3: plot sample-'.gz'-file
gz.files <- Sys.glob(paste0(path,'/*.gz'))
# v(gz.files[2]) ## plot content of gz-file
 
 
## Example 4: load sample-'.gz'-file manually as Raster-object and plot it
obj <- readbin(gz.files[2],area='lion')
# par(mfrow=c(1,2))
# v(obj,param="sst",subplot = TRUE)
# v(obj,param="Temp",subplot = TRUE) ## note unset "pal" (colormap) for unkown "param"-values!


## Example 5: available color maps
data('cmap') # load color maps data
names(cmap) # list available color maps

gz.files <- Sys.glob(paste0(path,'/*.gz'))
# figure(width=15,height=15)
# par(mfrow=c(4,5))
# for(n in names(cmap)) v(gz.files[2], v_area='lion', subplot=TRUE,
#                         pal=n, adaptive.vals=TRUE, main=n)

## define new color maps from blue to red to white:
n <- colorRampPalette(c('blue','red','white'))(100)
# v(gz.files[2], v_area='lion', subplot=TRUE,
#  pal=n, adaptive.vals=TRUE, main="own colormap")


## Example 6: available parameters
data(parameter_definitions)
names(parameter_definitions)
# ?parameter_definitions

# figure(width=12, height=6.2)
# par(mfrow=c(2,3))
# v('*sst2*707*',v_area="medw4",main="sst", folder=path, subplot=TRUE)
# v('*chla*531*',v_area="medw4",main="chla", folder=path, subplot=TRUE)
# v('*chlagrad*',v_area="medw4",main="chlagrad",folder=path, subplot=TRUE)
# v('*p100*',v_area="medw4",main="p100 (oceanic fronts)",folder=path, subplot=TRUE)
# v('*sla*',v_area="medw4",main="sla",folder=path, subplot=TRUE)
# h <- get.bathy("medw4",visualize=TRUE,terrain=F,res=4, subplot=TRUE,main="bathy")

################## advanced example section:

## Example I: plot bathymetry using a v_area-keyword
## requires server connection!
# par(mfrow=c(2,1))
# v("bathy","lion",res=4, keep=TRUE,border='grey',subplot=TRUE, 
#   main='Gulf of Lions bathymetry',cb.title="resolution 4 min")

# v("bathy","lion",res=1, keep=TRUE,border='grey',subplot=TRUE,
#   cb.title="resolution 1 min")  # can take some time depending on server connection!


## Example II: plot bathymetry of the Baltic Sea defined by longitude and latidtue coordinates
## requires server connection!
lon <- c(9, 31)
lat <- c(53.5, 66)
#v("bathy",lon=lon,lat=lat,main="Baltic Sea")


## Example III: plot landmask of the Baltic Sea defined by an extent- or raster-object
## requires server connection!
library('raster')
ext <- extent(lon,lat)
# v("bathy",ext,main="Baltic Sea",res=4,levels=200) # extent-object


## Example IV: plot '.gz'-files, following default plot-procedure

check_gzfiles(folder=path) # return file summary-table
gz.files <- Sys.glob(paste0(path,'/*.gz')) # load sample-'.gz'-files
# v(gz.files[1:4])
# v(gz.files[4],bwd=2)

## Example V: plot climatologies from '.gz'-files 
##            (ATTENTION: not working for non-'gz'-files, requiring ImageMagick)
# clim_plot('*1s*.gz' ,folder = path,bwd=0.7,adaptive.vals=TRUE,plotname="seasonal_climatology.png")

## Example VI: plot subregion of gz-files as subplots
# graphics.off()
# par(mfrow=c(2,1))
# v(gz.files[1:2],v_area='lion',subplot=TRUE) # run ?region_definitions to see predefined regions


## Example VII: plot subregion of raster file

# all manual:
obj <- readbin(gz.files[2],area='lion')
dev.new()
ticks <- seq(20,30,5)
par(mar=c(5,4,5,8))
image(obj,zlim=range(ticks),col=cmap$jet)
plotmap('lion',add=TRUE) # add landmask
# set.colorbar(ticks=ticks,cb.title='cb.title',cb.xlab='cb.xlab')

## using v, reconstructing region information
# obj <- readbin(gz.files[2],area='lion')
# v(obj,varname="sst2",cb.title='cb.title',cb.xlab='cb.xlab')

# using v for another subregion
ncorse <- crop(obj,extent(6,9,40,42))
# v(ncorse,grid.res=1)
# v(ncorse,zlim=c(20,30),cbx=c(8.3,8.9),cby=c(40.7,40.8)) # skipping colorbar widget


## Example VIII: Add region by supplying raster-object, colorbar positions and running the widget
#add.region(ncorse,cbx=c(8.3,8.9),cby=c(40.7,40.8))


## Example IX: plot netcdf-files ('.nc'-files)
nfiles <- Sys.glob(paste0(path,'/*.nc')) # load sample-'.nc'-files
head(nfiles)

## plot herring larval dispersal from Bauer et al. (2013)
# par(mfrow=c(2,2))
# v(nfiles[1], subplot=TRUE, t=1:4,minv=0, maxv=1000, adaptive.vals=FALSE, replace.na=TRUE)
# par(new=TRUE,mfrow=c(1,1))
# empty.plot(main='herring larval dispersal in the Greifswald lagoon, Germany')
# mtext('see Bauer et al. (2013) as reference')

# plot bathymetric data (obtained from the Leibniz Institute for Baltic Sea Research Warnemuende)
# v(nfiles[2],varname='bathymetry') # following default plot-procedure
# v(nfiles[2],varname='bathymetry',pal='haxbyrev',Log=TRUE, cb.xlab='depth [log m]',levels=50)







