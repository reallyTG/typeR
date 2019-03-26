library(OSMscale)


### Name: scaleBar
### Title: scalebar for OSM plots
### Aliases: scaleBar
### Keywords: aplot spatial

### ** Examples

if(interactive()){
d <- data.frame(long=c(12.95, 12.98, 13.22, 13.11), lat=c(52.40,52.52, 52.36, 52.45))
map <- pointsMap(lat,long,d, scale=FALSE, zoom=9)
coord <- scaleBar(map)  ; coord
scaleBar(map, bg=berryFunctions::addAlpha("white", 0.7))
scaleBar(map, 0.3, 0.05, unit="m", length=0.45, type="line")
scaleBar(map, 0.3, 0.5, unit="km", abslen=5, col=4:5, lwd=3)
scaleBar(map, 0.3, 0.8, unit="mi", col="red", targ=list(col="blue", font=2), type="line")

# I don't like subdivisions, but if you wanted them, you could use:
scaleBar(map, 0.12, 0.28, abslen=10, adj=c(0.5, -1.5)  )
scaleBar(map, 0.12, 0.28, abslen=4, adj=c(0.5, -1.5), targs=list(col="transparent"), label="" )
}

## Not run: 
##D  # don't download too many maps in R CMD check
##D d <- read.table(header=TRUE, sep=",", text="
##D lat, long
##D 52.514687,  13.350012   # Berlin
##D 51.503162,  -0.131082   # London
##D 35.685024, 139.753365") # Tokio
##D map <- pointsMap(lat, long, d, zoom=2, abslen=5000, y=0.7)
##D scaleBar(map, y=0.5, abslen=5000)   # in mercator projections, scale bars are not
##D scaleBar(map, y=0.3, abslen=5000)   # transferable to other latitudes
##D 
##D map_utm <- pointsMap(lat, long, d[1:2,], proj=putm(long=d$long[1:2]),
##D                      zoom=4, y=0.7, abslen=500)
##D scaleBar(map_utm, y=0.5, abslen=500) # transferable in UTM projection
##D scaleBar(map_utm, y=0.3, abslen=500)
## End(Not run)

## Not run: 
##D  ## Too much downloading time, too error-prone
##D # Tests around the world
##D par(mfrow=c(1,2), mar=rep(1,4))
##D long <- runif(2, -180, 180) ;  lat <- runif(2, -90, 90)
##D long <- 0:50 ;  lat <- 0:50
##D map <- pointsMap(lat, long)
##D map2 <- pointsMap(lat, long, map=map, proj=putm(long=long))
## End(Not run)

## Not run: 
##D  ## excluded from tests to avoid package dependencies
##D berryFunctions::require2("SDMTools")
##D berryFunctions::require2("raster")
##D berryFunctions::require2("mapmisc")
##D par(mar=c(0,0,0,0))
##D map <- OSMscale::pointsMap(long=c(12.95, 13.22), lat=c(52.52, 52.36))
##D SDMTools::Scalebar(x=1443391,y=6889679,distance=10000)
##D raster::scalebar(d=10000, xy=c(1443391,6884254))
##D OSMscale::scaleBar(map, x=0.35, y=0.45, abslen=5)
##D library(mapmisc) # otherwise rbind for SpatialPoints is not found
##D mapmisc::scaleBar(map$tiles[[1]]$projection, seg.len=10, pos="center", bg="transparent")
## End(Not run)




