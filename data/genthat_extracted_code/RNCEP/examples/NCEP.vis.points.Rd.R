library(RNCEP)


### Name: NCEP.vis.points
### Title: Visualize Weather Data Interpolated to a Point on a Map
### Aliases: NCEP.vis.points

### ** Examples

## Not run: 
##D library(RNCEP)
##D ## In this example, we use datetime and locational data
##D ## obtained from a GPS device attached to a lesser 
##D ## black-backed gull. 
##D data(gull, package='RNCEP')
##D 
##D ## First, visualize the entire track representing altitude
##D ## with the point colors ##
##D ## Note the specification of the title
##D ## Also, note the specification of the legend label
##D ## and adjustment of its placement
##D NCEP.vis.points(wx=gull$altitude, lats=gull$latitude, 
##D     lons=gull$longitude, cols=topo.colors(64),
##D     title.args=list(main='Lesser black-backed gull'),
##D     image.plot.args=list(legend.args=list(text='Altitude',
##D     adj=-1, cex=1.25)))
##D 
##D ## Take a subset of the data based on the datetime of 
##D ## the measurement ##
##D ss <- subset(gull, format(gull$datetime, "%Y-%m-%d %H:%M:%S") >=
##D     "2008-09-19 16:00:00" & format(gull$datetime, 
##D     "%Y-%m-%d %H:%M:%S") <= "2008-09-19 19:30:00")
##D 
##D 
##D ## Now collect cloud cover, temperature, and wind
##D ## information for each point in the subset ##
##D cloud <- NCEP.interp(variable='tcdc.eatm', level='gaussian', 
##D     lat=ss$latitude, lon=ss$longitude, dt=ss$datetime, 
##D     reanalysis2=TRUE, keep.unpacking.info=TRUE)
##D temp <- NCEP.interp(variable='air.sig995', level='surface', 
##D     lat=ss$latitude, lon=ss$longitude, dt=ss$datetime,
##D     reanalysis2=FALSE, keep.unpacking.info=TRUE)
##D uwind <- NCEP.interp(variable='uwnd', level=925, 
##D     lat=ss$latitude, lon=ss$longitude, dt=ss$datetime,
##D     reanalysis2=TRUE, keep.unpacking.info=TRUE)
##D vwind <- NCEP.interp(variable='vwnd', level=925, 
##D     lat=ss$latitude, lon=ss$longitude, dt=ss$datetime, 
##D     reanalysis2=TRUE, keep.unpacking.info=TRUE)	
##D 
##D ## Now visualize the subset of the GPS track using color
##D ## to indicate the cloud cover ##
##D ## Note the adjustment to the color of the basemap
##D ## And the setting of the map range ##
##D ## And the explicit placement of the colorbar legend
##D ## using the smallplot argument
##D NCEP.vis.points(wx=cloud, lats=ss$latitude, lons=ss$longitude,
##D     cols=rev(heat.colors(64)),
##D     map.args=list(col='darkgreen',xlim=c(-7,4), ylim=c(40,50)),
##D     title.args=list(main='Lesser black-backed gull'),
##D     image.plot.args=list(legend.args=list(text='Cloud Cover %',
##D         adj=-.1, padj=-.5, cex=1),
##D     smallplot=c(.83,.86,.15,.85)))
##D 
##D ## Now visualize the subset of the GPS track using color
##D ## to indicate the temperature ##
##D ## Note the adjustment of point size
##D NCEP.vis.points(wx=temp, lats=ss$latitude, lons=ss$longitude,
##D     cols=rev(heat.colors(64)),
##D     points.args=list(cex=1.25),
##D     title.args=list(main='Lesser black-backed gull'),
##D     image.plot.args=list(legend.args=list(text='Kelvin',
##D         adj=-.4, padj=-.5, cex=1.15)),
##D     map.args=list(xlim=c(-7,4), ylim=c(40,50)))
##D 
##D ## Now calculate the tailwind component from the U and V
##D ## wind components assuming that the bird's preferred 
##D ## direction is 225 degrees
##D tailwind <- (sqrt(uwind^2 + vwind^2)*cos(((atan2(uwind,vwind)*
##D     (180/pi))-225)*(pi/180)))
##D 
##D ## Now visualize the subset of the GPS track using color
##D ## to indicate the tailwind speed ##
##D ## Note the adjustment of grid and axis properties
##D NCEP.vis.points(wx=tailwind, lats=ss$latitude, lons=ss$longitude,
##D     cols=rev(heat.colors(64)),
##D     axis.args=list(las=2), grid.args=list(lty=1),
##D     title.args=list(main='Lesser black-backed gull'),
##D     image.plot.args=list(legend.args=list(text='Tailwind m/s',
##D         adj=0, padj=-2, cex=1.15)),
##D     map.args=list(xlim=c(-7,4), ylim=c(40,50)))
## End(Not run)



