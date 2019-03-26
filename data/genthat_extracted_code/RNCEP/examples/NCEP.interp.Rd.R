library(RNCEP)


### Name: NCEP.interp
### Title: Interpolates Weather Data to a point in space and time
### Aliases: NCEP.interp NCEP.interp.gaussian NCEP.interp.pressure
###   NCEP.interp.surface robust.NCEP.interp.gaussian
###   robust.NCEP.interp.pressure robust.NCEP.interp.surface

### ** Examples

## Not run: 
##D library(RNCEP)
##D ###############################################################
##D ###############################################################
##D ## The function can be applied to interpolate a single variable 
##D ## to a single point in space and time ##
##D ## Interpolate temperature from the 850 mb pressure level ##
##D wx.interp <- NCEP.interp(variable='air', level=850, lat=55.1,
##D     lon=11.3, dt='2006-10-12 17:23:12',
##D     interp='linear')
##D 
##D ## Interpolate precipitable water (for the entire atmosphere, but
##D ## described in reference to the surface)
##D wx.interp <- NCEP.interp(variable='pr_wtr.eatm', level='surface',
##D     lat=55.1, lon=11.3, dt='2006-10-12 17:23:12',
##D     interp='linear')
##D 
##D ## Interpolate specific humidity (at the surface, but in 
##D ## reference to a T62 Gaussian grid) using the IDW interpolation
##D wx.interp <- NCEP.interp(variable='shum.2m', level='gaussian',
##D     lat=55.1, lon=11.3, dt='2006-10-12 17:23:12',
##D     interp='IDW', p=1)
##D 
##D ###################################################################
##D ###################################################################	
##D ## The function can also be applied to interpolate several variables,
##D ## locations, datetimes, and/or methods of interpolation in a single
##D ## function call ##
##D ## Interpolate temperature from the 850 and 700 mb pressure levels ## 
##D ## for the same time and location ##
##D wx.interp <- NCEP.interp(variable='air', level=c(850,700), lat=55.1,
##D     lon=11.3, dt='2006-10-12 17:23:12',
##D     interp='linear')
##D 
##D ## Interpolate temperature and relative humidity from the 1000 mb 
##D ## pressure level ##
##D wx.interp <- NCEP.interp(variable=c('air','rhum'), level=1000, 
##D     lat=55.1, lon=11.3, dt='2006-10-12 17:23:12', interp='linear')
##D 
##D ## Interpolate temperature and relative humidity 
##D ## from the 1000 and 700 mb pressure levels, respectively
##D ## for the same datetime ##
##D wx.interp <- NCEP.interp(variable=c('air','rhum'), 
##D     level=c(1000,700), lat=55.1, lon=11.3, 
##D     dt='2006-10-12 17:23:12', interp='linear')
##D 
##D ## Interpolate temperature and relative humidity 
##D ## from the 1000 and 700 mb pressure levels, respectively
##D ## for different datetimes ##
##D wx.interp <- NCEP.interp(variable=c('air','rhum'), level=c(1000,700), lat=55.1,
##D     lon=11.3, dt=c('2006-10-12 17:23:12', '2006-10-12 18:05:31'),
##D     interp='linear')
##D 	
##D ## Interpolate geopotential height using 'linear', 'IDW', and 
##D ## 'nearest neighbor' interpolation ##
##D wx.interp <- NCEP.interp(variable='hgt', level=700, lat=55.1,
##D     lon=11.3, dt='2006-10-12 17:23:12',
##D     interp=c('linear','IDW','IDW'), 
##D     interpolate.space=c(TRUE,TRUE,FALSE))
##D 
##D ###############################################################
##D ###############################################################
##D ## Alternatively the function can be applied to interpolate a
##D ## weather variable to multiple datetime and point locations
##D ## in a single function call ##  
##D 
##D ## In this example, we use datetime and locational data obtained 
##D ## from a GPS device attached to a lesser black-backed gull.
##D ## We interpolate wind information to to each point in the dataset
##D data(gull)
##D 
##D ## Take a subset of the data based on the datetime of 
##D ## the measurement ##
##D ss <- subset(gull, format(gull$datetime, "%Y-%m-%d %H:%M:%S") >=
##D     "2008-09-19 16:00:00" & format(gull$datetime, 
##D     "%Y-%m-%d %H:%M:%S") <= "2008-09-19 19:30:00")
##D 
##D 
##D ## Now collect wind information for each point in the subset ##
##D uwind <- NCEP.interp(variable='uwnd', level=925, 
##D     lat=ss$latitude, lon=ss$longitude, dt=ss$datetime,
##D     reanalysis2=TRUE, keep.unpacking.info=TRUE)
##D vwind <- NCEP.interp(variable='vwnd', level=925, 
##D     lat=ss$latitude, lon=ss$longitude, dt=ss$datetime, 
##D     reanalysis2=TRUE, keep.unpacking.info=TRUE)	
##D 
##D 	
##D ## Now calculate the tailwind component from the U and V
##D ## wind components assuming that the bird's preferred 
##D ## direction is 225 degrees
##D tailwind <- (sqrt(uwind^2 + vwind^2)*cos(((atan2(uwind,vwind)*
##D     (180/pi))-225)*(pi/180)))
##D 
##D ## Now visualize the subset of the GPS track using color
##D ## to indicate the tailwind speed ##
##D NCEP.vis.points(wx=tailwind, lats=ss$latitude, lons=ss$longitude,
##D     cols=rev(heat.colors(64)),
##D     title.args=list(main='Lesser black-backed gull'),
##D     image.plot.args=list(legend.args=list(text='Tailwind m/s',
##D     adj=0, padj=-2, cex=1.15)),
##D     map.args=list(xlim=c(-7,4), ylim=c(40,50)))
## End(Not run)



