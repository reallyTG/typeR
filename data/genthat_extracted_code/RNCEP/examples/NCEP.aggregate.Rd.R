library(RNCEP)


### Name: NCEP.aggregate
### Title: Temporally Aggregate Weather Data
### Aliases: NCEP.aggregate

### ** Examples

## Not run: 
##D library(RNCEP)
##D ######################################################
##D ## In the first example, we use the internal R function
##D ## 'mean' to calculate average temperatures per
##D ## month and year
##D 
##D ## First gather temperature data from a spatial extent
##D ## for January and February from 2000-2001. 
##D wx.extent <- NCEP.gather(variable='air', level=850, 
##D     months.minmax=c(1,2), years.minmax=c(2000,2001), 
##D     lat.southnorth=c(50, 55), lon.westeast=c(0, 5),
##D     reanalysis2=FALSE, return.units=TRUE)
##D 
##D ## Now calculate the average temperature per month and year ##
##D wx.ag <- NCEP.aggregate(wx.data=wx.extent, YEARS=TRUE, MONTHS=TRUE,
##D     DAYS=FALSE, HOURS=FALSE, fxn='mean')
##D 
##D ## Notice that aggregated time components have been replaced 
##D ## with "XX" or "XXXX" ##
##D dimnames(wx.ag)[[3]][1]
##D 	
##D #######################################################
##D ## In the second example, we create our own function to
##D ## calculate the percentage of observations at each grid
##D ## point with a temperature less than -5 degrees Celsius ##
##D 
##D ## First create the function ##
##D ## Note: temperature is in degrees Kelvin in NCEP database ##
##D COLD <- function(x){
##D     return(length(which(x < 273.15-5))/(length(x) - sum(is.na(x))))
##D     }
##D 
##D ## Now calculate the percentage of occuence of temperatures
##D ## less than -5 degrees Celsius per month and year ##
##D wx.cold <- NCEP.aggregate(wx.data=wx.extent, YEARS=TRUE, MONTHS=TRUE,
##D     DAYS=FALSE, HOURS=FALSE, fxn='COLD')
##D 
##D 	
##D ##########################################################
##D ## As explained in the Details section above,
##D ## calculating some variables requires sequential aggregations ##
##D ## Here we calculate the monthly mean of daily average
##D ## relative humidity.
##D 
##D ## First gather relative humidity data from near the surface
##D ## for a spatial extent for October through November 
##D ## from 2001-2002. 
##D wx.extent <- NCEP.gather(variable='rhum.sig995', level='surface',
##D     months.minmax=c(10,11), years.minmax=c(2001,2002), 
##D     lat.southnorth=c(50, 55), lon.westeast=c(0, 5),
##D     reanalysis2=FALSE, return.units=FALSE)
##D 
##D ## First calculate maximum daily relative humidity ##
##D wx.ag <- NCEP.aggregate(wx.data=wx.extent, 
##D     HOURS=FALSE, fxn='max')
##D 
##D ## Then calculate the monthly average of those daily maximums ##
##D wx.ag2 <- NCEP.aggregate(wx.data=wx.ag, 
##D     DAYS=FALSE, fxn='mean')
##D 
##D 	
##D 
##D ##########################################################
##D ## Data that have been aggregated may then be visualized
##D ## or exported in various formats ##
##D 
##D ###########################################
##D ## Visualize the aggregated temperatures ##
##D NCEP.vis.area(wx.ag2, title.args=
##D     list(main='Monthly average of daily maximum relative humidity
##D     \n October 2000'), image.plot.args=
##D     list(legend.args=list(text='%',
##D     cex=1.15, padj=-1, adj=-.25)))
##D 
##D ###########################################################
##D ## Export a layer of the data to a format that can then be
##D ## imported into ArcGIS ##
##D 
##D ## Convert the first layer of the aggregated array
##D ## to a data.frame ##
##D wx.df <- NCEP.array2df(wx.ag[,,1])
##D 
##D ## Specify that the data.frame is a spatial object
##D library(sp)
##D coordinates(wx.df) <- ~longitude+latitude
##D gridded(wx.df) <- TRUE
##D proj4string(wx.df) <- CRS('+proj=longlat + datum=WGS84')
##D 
##D ## Save the data in .asc format
##D write.asciigrid(wx.df, fname='wx.asc')
##D ## Note: Data will be written to your working directory ##
##D 
##D ## The resulting .asc file can be imported into ArcMap
##D ## using ArcMap's "ASCII to Raster" tool in the "Conversion Tools"
##D ## section of the ArcToolbox. ##
## End(Not run)



