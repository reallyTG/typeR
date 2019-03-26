library(RNCEP)


### Name: NCEP.gather
### Title: Queries Weather Data
### Aliases: NCEP.gather NCEP.gather.gaussian NCEP.gather.pressure
###   NCEP.gather.surface robust.NCEP.gather.gaussian
###   robust.NCEP.gather.pressure robust.NCEP.gather.surface

### ** Examples

## Not run: 
##D library(RNCEP)
##D ## Query the temperature from a particular pressure level ##
##D wx.extent1 <- NCEP.gather(variable='air', level=850,
##D     months.minmax=c(9,10), years.minmax=c(1996,1997),
##D     lat.southnorth=c(50,55), lon.westeast=c(5,10),
##D     reanalysis2 = FALSE, return.units = TRUE)
##D 
##D ## Query the temperature at 2 meters altitude with reference to
##D ## the surface
##D wx.extent2 <- NCEP.gather(variable='air.sig995', level='surface',
##D     months.minmax=c(2,3), years.minmax=c(2000,2001),
##D     lat.southnorth=c(50,55), lon.westeast=c(0,5),
##D     reanalysis2 = FALSE, return.units = TRUE)
##D 
##D ## Query the temperature at 2 meters altitude with reference to
##D ## a T62 Gaussian grid
##D wx.extent3 <- NCEP.gather(variable='air.2m', level='gaussian',
##D     months.minmax=c(4,5), years.minmax=c(2006,2007),
##D     lat.southnorth=c(32,35), lon.westeast=c(-35,-32),
##D     reanalysis2 = FALSE, return.units = TRUE)
##D 
##D ## Note that the dimnames of the data array indicate the 
##D ## latitudes, longitudes, and datetimes	of the data. ##
##D dimnames(wx.extent1)
##D ## Therefore, the latitudes, longitudes, and datetimes
##D ## can be called. ##
##D dimnames(wx.extent1)[[1]] ## latitudes
##D dimnames(wx.extent1)[[2]] ## longitudes
##D dimnames(wx.extent1)[[3]] ## datetimes
##D 
##D #################################################################
##D #################################################################
##D #################################################################
##D ## THERE ARE MANY OPTIONS FOR CREATING DIFFERENT R OBJECTS  
##D ## AND/OR FOR EXPORTING THESE WEATHER DATA.
##D ## HERE ARE A FEW EXAMPLES
##D 
##D #########################################################
##D #########################################################
##D ## The data array may be saved directly as an R object ##
##D save(wx.extent, file='wx_extent.Rdata')
##D ## And then later recalled ##
##D load(file='wx_extent.Rdata')
##D 
##D 
##D ################################################################
##D ################################################################
##D ## Another option is to create a raster object from the array ##
##D ## For more info, see package raster
##D library(raster)
##D 
##D ## Using the data from a query above ##
##D ## First create a stacked raster object using the first 
##D ## layer (i.e. datetime) of the weather data array ##
##D ## Notice the offset of 1.25 degrees (1/2 the spatial resolution)
##D ## to describe the limits of the bounding box not the points
##D ras <- stack(raster(wx.extent1[,,1], crs="+proj=longlat +datum=WGS84", 
##D     xmn=min(as.numeric(dimnames(wx.extent1)[[2]])) - 1.25,
##D     xmx=max(as.numeric(dimnames(wx.extent1)[[2]])) + 1.25, 
##D     ymn=min(as.numeric(dimnames(wx.extent1)[[1]])) - 1.25,
##D     ymx=max(as.numeric(dimnames(wx.extent1)[[1]])) + 1.25))
##D 
##D ## Then add each subsequent layer to the raster stack ##
##D for(i in 2:length(dimnames(wx.extent1)[[3]])){
##D     ras <- addLayer(ras, raster(wx.extent1[,,i], 
##D         crs="+proj=longlat +datum=WGS84", 
##D         xmn=min(as.numeric(dimnames(wx.extent1)[[2]])) - 1.25,
##D         xmx=max(as.numeric(dimnames(wx.extent1)[[2]])) + 1.25, 
##D         ymn=min(as.numeric(dimnames(wx.extent1)[[1]])) - 1.25,
##D         ymx=max(as.numeric(dimnames(wx.extent1)[[1]])) + 1.25))
##D     }
##D 
##D #######################################################
##D ## Optionally, export a layer from the raster stack to 
##D ## a format that can be imported by Esri's ArcGIS products ##
##D 
##D ## First, select a layer from the raster stack ##
##D ras1 <- raster(ras, layer=1)
##D 
##D ## Then write the data from that layer to a .bil file ##
##D writeRaster(ras, filename='ras_example.bil', format="EHdr")
##D ## The file will be saved in your current working directory ##
##D 
##D ## The resulting file can be imported into ArcGIS ##
##D ## by using the "Raster to Other Format" tool in the 
##D ## "To Raster" section of the ArcToolbox.
##D 
##D ###########################################################
##D ## NOTE: Weather data obtained from a Gaussian grid must 
##D ## first be resampled onto a regular grid !!! ##
##D ## Here we use the interp.loess() function
##D ## from the tgp package
##D 
##D ## Using data from a T62 Gaussian grid queried above 
##D ## Interpolate the data from the first layer (i.e. datetime)
##D ## onto a regular grid ##
##D library(tgp)
##D wx.reg <- interp.loess(x=rep(as.numeric(dimnames(wx.extent3)[[2]]), 
##D         each=length(dimnames(wx.extent3)[[1]])),
##D     y=rep(as.numeric(dimnames(wx.extent3)[[1]]), 
##D          length(dimnames(wx.extent3)[[2]])), 
##D     z=as.vector(wx.extent3[,,1]), span=0.6, 
##D     gridlen=c(length(dimnames(wx.extent3)[[2]]),
##D         length(dimnames(wx.extent3)[[1]])))
##D 
##D ## Create a stacked raster object from the first layer 
##D ## (i.e. datetime) after interpolation ##
##D ## Again, notice the offset (1/2 the resolution) ##
##D ## Also note that the matrix (i.e. wx.reg$z) must be flipped 
##D ## along the y axis and transposed ##
##D ## This is required b/c of the interpolation performed above ##
##D ras <- stack(raster(t(wx.reg$z[,length(wx.reg$y):1]), 
##D     crs="+proj=longlat +datum=WGS84", 
##D     xmn=min(as.numeric(wx.reg$x)) - abs(diff(wx.reg$x)[1]/2),
##D     xmx=max(as.numeric(wx.reg$x)) + abs(diff(wx.reg$x)[1]/2), 
##D     ymn=min(as.numeric(wx.reg$y)) - abs(diff(wx.reg$y)[1]/2),
##D     ymx=max(as.numeric(wx.reg$y)) + abs(diff(wx.reg$y)[1]/2)))
##D 	
##D ## Add each subsequent layer in the array to the raster stack ##
##D ## after interpolating onto a regular grid ##
##D 
##D for(i in 2:length(dimnames(wx.extent3)[[3]])){
##D 
##D   ## Interpolate
##D   t.wx.reg <- interp.loess(x=rep(as.numeric(dimnames(wx.extent3)[[2]]), 
##D       each=length(dimnames(wx.extent3)[[1]])), 
##D       y=rep(as.numeric(dimnames(wx.extent3)[[1]]), 
##D       length(dimnames(wx.extent3)[[2]])), 
##D       z=as.vector(wx.extent3[,,i]), span=0.6, 
##D       gridlen=c(length(dimnames(wx.extent3)[[2]]),
##D       length(dimnames(wx.extent3)[[1]])))
##D   
##D   ## Note the offset ##
##D   ## Note flipping the matrix along the y axis and transposing ##
##D   ## Add layer to stack
##D   ras <- addLayer(ras, raster(t(t.wx.reg$z[,length(t.wx.reg$y):1]),
##D     crs="+proj=longlat +datum=WGS84",
##D     xmn=min(as.numeric(t.wx.reg$x)) - abs(diff(t.wx.reg$x)[1]/2),
##D     xmx=max(as.numeric(t.wx.reg$x)) + abs(diff(t.wx.reg$x)[1]/2), 
##D     ymn=min(as.numeric(t.wx.reg$y)) - abs(diff(t.wx.reg$y)[1]/2),
##D     ymx=max(as.numeric(t.wx.reg$y)) + abs(diff(t.wx.reg$y)[1]/2)))
##D   }
##D 
##D ##################################################################
##D ##################################################################
##D ## Another option is to create a Spatial object
##D ## using the sp package
##D ## Again, data from a Gaussian grid may require special attention
##D ## as the grid points are unevenly spaced
##D library(sp)
##D 
##D ## Using the data from a query above
##D ## Convert the array to a data.frame ##
##D wx.df <- NCEP.array2df(wx.extent2)
##D 
##D ## Specify that the data.frame is a spatial object
##D library(sp)
##D coordinates(wx.df) <- ~longitude+latitude
##D gridded(wx.df) <- TRUE
##D proj4string(wx.df) <- CRS('+proj=longlat + datum=WGS84')
##D 
##D #########################################################
##D ## A Spatial object of a single datetime (i.e. layer) can 
##D ## be written to .asc, a format that may then be 
##D ## imported into ArcGIS.
##D 
##D ## First, convert the first layer of the array to a data.frame ##
##D wx.df <- NCEP.array2df(wx.extent2[,,1])
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
##D 
##D ##################################################################
##D ## There are still more options for writing these data to files ##
##D ## See e.g. writeMat() in the R.matlab package for writing Matlab files
##D ## Also see the RSAGA package for GIS functionality in R
##D ## One could even write the data array back to NetCDF 
##D ## (see packages RNetCDF and ncdf)
## End(Not run)



