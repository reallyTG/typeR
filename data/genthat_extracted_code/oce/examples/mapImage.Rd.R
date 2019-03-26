library(oce)


### Name: mapImage
### Title: Add an Image to a Map
### Aliases: mapImage

### ** Examples

## Not run: 
##D library(oce)
##D data(coastlineWorld)
##D data(topoWorld)
##D 
##D ## 1. topography
##D par(mfrow=c(2, 1), mar=c(2, 2, 1, 1))
##D lonlim <- c(-70, -50)
##D latlim <- c(40, 50)
##D topo <- decimate(topoWorld, by=2) # coarse to illustrate filled contours
##D topo <- subset(topo, latlim[1] < latitude & latitude < latlim[2])
##D topo <- subset(topo, lonlim[1] < longitude & longitude < lonlim[2])
##D mapPlot(coastlineWorld, type='l',
##D         longitudelim=lonlim, latitudelim=latlim,
##D         projection="+proj=lcc +lat_1=40 +lat_2=50 +lon_0=-60")
##D breaks <- seq(-5000, 1000, 500)
##D mapImage(topo, col=oce.colorsGebco, breaks=breaks)
##D mapLines(coastlineWorld)
##D box()
##D mapPlot(coastlineWorld, type='l',
##D         longitudelim=lonlim, latitudelim=latlim,
##D         projection="+proj=lcc +lat_1=40 +lat_2=50 +lon_0=-60")
##D mapImage(topo, filledContour=TRUE, col=oce.colorsGebco, breaks=breaks)
##D box()
##D mapLines(coastlineWorld)
##D 
##D ## 2. Northern polar region, with color-coded bathymetry
##D par(mfrow=c(1,1))
##D drawPalette(c(-5000, 0), zlim=c(-5000, 0), col=oce.colorsJet)
##D mapPlot(coastlineWorld, projection="+proj=stere +lat_0=90",
##D         longitudelim=c(-180,180), latitudelim=c(60,120))
##D mapImage(topoWorld, zlim=c(-5000, 0), col=oce.colorsJet)
##D mapLines(coastlineWorld[['longitude']], coastlineWorld[['latitude']])
##D 
##D ## 3. Levitus SST
##D par(mfrow=c(1,1))
##D data(levitus, package='ocedata')
##D lon <- levitus$longitude
##D lat <- levitus$latitude
##D SST <- levitus$SST
##D par(mar=rep(1, 4))
##D Tlim <- c(-2, 30)
##D drawPalette(Tlim, col=oce.colorsJet)
##D mapPlot(coastlineWorld, projection="+proj=moll", grid=FALSE)
##D mapImage(lon, lat, SST, col=oce.colorsJet, zlim=Tlim)
##D mapPolygon(coastlineWorld, col='gray')
##D 
##D ## 4. Topography without drawing a coastline first
##D data(topoWorld)
##D cm <- colormap(topoWorld[['z']], name='gmt_relief')
##D drawPalette(colormap=cm)
##D mapPlot(c(-180,180), c(-90,90), type="n") # defaults to moll projection
##D mapImage(topoWorld, colormap=cm)
## End(Not run)




