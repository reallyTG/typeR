library(oceanmap)


### Name: plotmap
### Title: plots landmask of a defined region
### Aliases: plotmap

### ** Examples

#### Example 1: plot landmask of the Mediterranean Sea
## a) by using longitude and latitude coordinates:
lon <- c(-6, 37)
lat <- c(30, 46)
figure(width=9.75,height=5.28)
plotmap(lon=lon, lat=lat, main="Mediterranean Sea")
plotmap(xlim=lon, ylim=lat, main="Mediterranean Sea")

## b) plot landmask of the Mediterranean Sea by using an extent-object:
library('raster')
ext <- extent(lon, lat)
# plotmap(ext, main="Mediterranean Sea") # extent-object

## c) plot landmask of the Mediterranean Sea by using a raster-object:
r <- raster(ext)
# plotmap(r, main="Mediterranean Sea") # raster-object

## d) plot landmask of the Mediterranean Sea by using a region label:
plotmap('med4', main="Mediterranean Sea") # region-label
# regions() ## check preinstalled region label

## e) add landmask to an existing plot:
plot(3.7008, 43.4079, xlim=lon, ylim=lat)
plotmap(add=T)
points(3.7008, 43.4079, pch=19)


#### Example 2: subplots and some additional arguments of plotmap()
par(mfrow=c(2, 1))
plotmap('medw4', main="Western Mediterranean Sea",col.bg="darkblue")
plotmap('medw4', main="Western Mediterranean Sea", bwd=3, border='grey', grid=FALSE)


#### Example 3: plotmap() and figure()
do.save <- FALSE ## open a plotting window
figure("Gulf_of_Lions_extended", do.save=do.save, width=5, height=5, type="pdf")
plotmap("lion",col.bg='darkblue',grid=FALSE)
close_fig(do.save)

## now resize figure manually and get new figure dimensions:
# width <- dev.size()[1]
# height <- dev.size()[2]

# do.save <- TRUE ## do NOT open a plotting window, but save figure internally
# figure("Gulf_of_Lions_extended", do.save=do.save, width=width, height=height, type="pdf")
# plotmap("lion",col.bg='darkblue',grid=FALSE)
# close_fig(do.save)


#### Example 4: between hemispheres
# par(mfrow=c(2,1))
# plotmap(lon=c(-180, 180), lat=c(-80, 80), main="map from West to East")
# plotmap(lon=c(0, 360), lat=c(-80, 80), main="map from West to East")
# plotmap(lon=c(-360, 00), lat=c(-80, 80), main="map from West to East") # same as before

#### Example 5: plot bathymetry and topography of the western Mediterranean Sea
#get.bathy("medw4",visualize=T,terrain=T,res=3)
#get.bathy("medw4",visualize=T,terrain=F,res=3,levels=c(200,2000)) # show contours
#get.bathy("lion",visualize=T,terrain=F,res=3,levels=c(200,2000),v_image=F) # show only contours

#### Example 6: testing some additional arguments
# lon <- c(-180,200); lat <- c(-80,90); 
# ext <- extent(lon, lat)
# plotmap(ext, border=NA, bwd=NA, grid=FALSE, col.land = "#9ac0cd",axes=FALSE)




