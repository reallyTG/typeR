library(loa)


### Name: 1.2.GoogleMap.and.geoplotting.tools
### Title: Google Maps plotting for lattice
### Aliases: 1.2.GoogleMap.and.geoplotting.tools GoogleMap GoogleMap.old
###   googleMap quickMap makeMapArg getMapArg panel.GoogleMapsRaster
###   panel.GoogleMaps xscale.components.GoogleMaps
###   yscale.components.GoogleMaps axis.components.GoogleMaps
### Keywords: methods

### ** Examples


## Example 1
## quickMap code
## as example of third-party use of functions

quickMap <- function(lat, lon, show.data = FALSE, ...){

    #get map
    map <- makeMapArg(lat, lon, ...)

    #scale axis for map projection
    map.axis.comps <- axis.components.GoogleMaps(map)
    map.axis <- function(components, ...) 
                   axis.default(components = map.axis.comps, ...)

    #scale data for map projection
    #see ?Rgooglemaps:::LatLon2XY
    temp <- LatLon2XY.centered(map, lat, lon)
    lat <- temp$newY
    lon <- temp$newX

    #plot data on map
    xyplot(lat~lon, 
           xlim = map$xlim, ylim = map$ylim,
           aspect = map$aspect, 
           axis = map.axis,
           panel = function(...){
               panel.GoogleMapsRaster(map)
               if(show.data)
                   panel.xyplot(...)
           }, ...)
}

## Example 2
## Off-line GoogleMap examples

#  Use a subsample of lat.lon.meuse
temp <- lat.lon.meuse[sample(1:155, 15),]


GoogleMap(zinc~latitude*longitude, col.regions=c("grey", "darkred"), 
          data=temp, map=roadmap.meuse)

GoogleMap(zinc~latitude*longitude, col.regions=c("grey", "darkred"),
          panel=panel.binPlot, 
          data=temp, map=roadmap.meuse)

GoogleMap(cadmium*50+copper*10+lead*2+zinc~latitude*longitude, 
          col.regions=c("grey", "darkred"), 
          key.z.main="Concentrations", panel.zcases = TRUE,
          data=temp, map=roadmap.meuse)

GoogleMap(cadmium*50+copper*10+lead*2+zinc~latitude*longitude, 
          col.regions=c("grey", "darkred"), panel=panel.zcasePiePlot,
          data=temp, map=roadmap.meuse)

#  Note 1:
#  Here, the map argument is supplied so example works off-line. 
#  If not supplied and R is on-line, GoogleMap will get map 
#  from the Google API. Repeat any of above without map argument 
#  when on-line. For example:
## Not run: 
##D    GoogleMap(zinc~latitude*longitude, col.regions=c("grey", "darkred"), 
##D              data=lat.lon.meuse)
## End(Not run)
#  (The map will appear slightly different because non-default 
#  size and maptype settings were used to make roadmap.meuse. See 
#  ?roadmap.meuse for details.)  

#  Note 2:
#  To make a map for use with panel.GoogleMaps or panel.GoogleMapsRaster 
#  without plotting use makeMapArg(). To recover a map from a previously 
#  plotted loa GoogleMap use getMapArg().




