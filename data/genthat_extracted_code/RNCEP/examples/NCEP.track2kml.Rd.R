library(RNCEP)


### Name: NCEP.track2kml
### Title: Plot a track in Google Earth
### Aliases: NCEP.track2kml

### ** Examples

## Not run: 
##D ## Load the gull dataset ##
##D data(gull)
##D 
##D ## Create a subset of the full dataset ##
##D g <- gull[1:100,]
##D 
##D ## Create a .kml file from a portion of the GPS track ##
##D NCEP.track2kml(latitude=g$latitude, longitude=g$longitude,
##D     datetime=as.character(g$datetime), altitude=g$altitude, 
##D     col.variable=g$altitude, col.scheme='heat.colors',
##D     point.alpha=255, line.color='goldenrod', line.alpha=255,
##D 	size.variable=NULL, point.names=NULL, 
##D     data.variables=data.frame(g$altitude),
##D 	output.filename='track', descriptive.filename=NULL)
## End(Not run)



