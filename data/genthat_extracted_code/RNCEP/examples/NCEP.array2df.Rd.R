library(RNCEP)


### Name: NCEP.array2df
### Title: Convert data from an array to a data frame
### Aliases: NCEP.array2df

### ** Examples

## Not run: 
##D library(RNCEP)
##D ############################################################
##D ############################################################
##D ## In this first example, we take data from a single 3-D array
##D ## and arrange them in a data.frame ##
##D #############################################################
##D 
##D ## First query the temperature for a particular pressure level
##D ## and datetime range ##
##D wx.extent <- NCEP.gather(variable='air', level=850,
##D     months.minmax=c(8,9), years.minmax=c(2006,2007),
##D     lat.southnorth=c(50,55), lon.westeast=c(0,5),
##D     reanalysis2 = FALSE, return.units = TRUE)
##D 	
##D ## Then convert the 3-D array to a data.frame ##
##D wx.df <- NCEP.array2df(wx.data=wx.extent, var.names='Temperature')
##D 
##D ############################################################
##D ############################################################
##D ## In this second example, we take data from two 3-D arrays 
##D ## and arrange them in a single data.frame ##
##D #############################################################
##D 
##D ## Query the U (east/west) and V (north/south) wind components
##D ## for a particular pressure level and datetime range ##
##D wx.uwnd <- NCEP.gather(variable='uwnd', level=850,
##D     months.minmax=c(8,9), years.minmax=c(2006,2007),
##D     lat.southnorth=c(50,55), lon.westeast=c(0,5),
##D     reanalysis2 = FALSE, return.units = TRUE)
##D wx.vwnd <- NCEP.gather(variable='vwnd', level=850,
##D     months.minmax=c(8,9), years.minmax=c(2006,2007),
##D     lat.southnorth=c(50,55), lon.westeast=c(0,5),
##D     reanalysis2 = FALSE, return.units = TRUE)	
##D 	
##D ## Then convert the two 3-D arrays to a single data.frame ##
##D wx.df <- NCEP.array2df(wx.data=list(wx.uwnd, wx.vwnd), 
##D     var.names=c('Uwind', 'Vwind'))
## End(Not run)



