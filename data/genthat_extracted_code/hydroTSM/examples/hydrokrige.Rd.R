library(hydroTSM)


### Name: hydrokrige
### Title: Krige for Hydrological Time Series
### Aliases: hydrokrige hydrokrige.default hydrokrige.data.frame
### Keywords: math

### ** Examples

############
## Loading the monthly time series of precipitation within the Ebro River basin.
data(EbroPPtsMonthly)

## Loading the gis data
data(EbroPPgis)

## Loading the shapefile with the subcatchments
data(EbroCatchmentsCHE)

## Projection for the Subcatchments file
# European Datum 50, Zone 30N
require(sp)
p4s <- CRS("+proj=utm +zone=30 +ellps=intl +units=m +no_defs")

## Selecting the first day of 'EbroPPtsMonthly' for all the stations.
# The first column of 'EbroPPtsMonthly' has the dates
x.ts <- as.numeric(EbroPPtsMonthly[1, 2:ncol(EbroPPtsMonthly)])

## Setting the name of the gauging stations
names(x.ts) <- colnames(EbroPPtsMonthly[1,2:ncol(EbroPPtsMonthly)])

##################################################
## 1) IDW interpolation and plot
## Probably you will need to resize your window 
## Not run: 
##D x.idw <- hydrokrige(x.ts= x.ts, x.gis=EbroPPgis, 
##D                     X="EAST_ED50", Y="NORTH_ED50", sname="ID", bname="CHE_BASIN_NAME",
##D                     type= "both",
##D                     subcatchments= EbroCatchmentsCHE,
##D                     cell.size= 3000, 
##D                     ColorRamp= "Precipitation",	
##D                     main= "IDW Precipitation on the Ebro")
## End(Not run)
           
##################################################
## 2) Ordinary Kriging interpolation and plot, in catchments defined by a shapefile
## Probably you will need to resize your window
## Not run: 
##D  
##D 
##D # Computing OK, over of 3000x3000m, sampled withinthe subcatchments defined by 'subcatchments'
##D x.ok <- hydrokrige(x.ts= x.ts, x.gis=EbroPPgis, 
##D                    X="EAST_ED50", Y="NORTH_ED50", sname="ID", bname="CHE_BASIN_NAME",
##D                    type= "both", formula=value~1,
##D                    subcatchments= EbroCatchmentsCHE,
##D                    p4s= p4s, 
##D                    cell.size= 3000, 
##D                    ColorRamp= "Precipitation", 
##D                    main= "OK Precipitation on the Ebro", arrow.plot= TRUE, 
##D                    arrow.offset= c(900000,4750000), arrow.scale= 20000,
##D                    scalebar.plot= TRUE, 
##D                    sb.offset= c(400000,4480000), sb.scale= 100000)
##D 
##D 
##D # Getting the interpolated values in each polygon 
##D # ('var1.pred' field in the output data.frame object)
##D x.ok.block <- slot(x.ok[["Block"]], "data")
##D 
##D # Getting the interpolated values in each cell (SpatialPixelsDataFrame object)
##D # (the pedicted values in each cell are stored in the 'var1.pred' field of the 
##D #  'data' slot)
##D x.ok.cells <- x.ok[["Cells"]]
##D 
##D # Plotting the interpolated values in each cell
##D spplot(x.ok.cells, "var1.pred")
## End(Not run)

##################################################
## 3)  Ordinary Kriging interpolation and plot, in an area defined by a raster map.
## The raster map may be any \link[sp]{SpatialGridDataFrame-class} object, read with 
## the \code{\link[rgdal]{readGDAL}} function of the \pkg{rgdal} package or similar. 
## Probably you will need to resize your window

#Loading the DEM
data(EbroDEM1000m)

#Giving a meaningful name to the predictor
EbroDEM1000m$ELEVATION <- EbroDEM1000m$band1

# Saving memory
EbroDEM1000m$band1 <- NULL

# Computing OK, over the spatial grid defined by the DEM
## Not run: 
##D x.ok <- hydrokrige(x.ts= x.ts, x.gis=EbroPPgis, 
##D                    X="EAST_ED50", Y="NORTH_ED50", sname="ID", 
##D                    formula=value~1,
##D                    p4s= p4s, 
##D                    predictors=EbroDEM1000m,
##D                    ColorRamp= "Precipitation", 
##D                    main= "OK Precipitation on the Ebro",
##D                    arrow.plot= TRUE, 
##D                    arrow.offset= c(900000,4750000), arrow.scale= 20000,
##D                    scalebar.plot= TRUE, 
##D                    sb.offset= c(400000,4480000), sb.scale= 100000)
## End(Not run)

##################################################
## 4) Kriging with External Drift interpolation and plot
## Probably you will need to resize your window

#Loading the DEM
data(EbroDEM1000m)

#Giving a meaningful name to the predictor
EbroDEM1000m$ELEVATION <- EbroDEM1000m$band1

# Saving memory
EbroDEM1000m$band1 <- NULL

# Forcing the projection of the DEM to be the same of the 'subcatchments' argument
# (just because I know in advance they are the same)
proj4string(EbroDEM1000m) <- p4s

# Computing KED
## Not run: 
##D x.ked <- hydrokrige(x.ts= x.ts, x.gis=EbroPPgis, 
##D                     X="EAST_ED50", Y="NORTH_ED50", sname="ID", 
##D                     bname="CHE_BASIN_NAME", elevation="ELEVATION",
##D                     type= "cells", 
##D                     formula=value~ELEVATION,
##D                     subcatchments= EbroCatchmentsCHE,
##D                     predictors=EbroDEM1000m,
##D                     cell.size= 3000, 
##D                     ColorRamp= "Precipitation", 
##D                     main= "KED Precipitation on the Ebro",
##D                     arrow.plot= TRUE, 
##D                     arrow.offset= c(900000,4750000), arrow.scale= 20000,
##D                     scalebar.plot= TRUE, 
##D                     sb.offset= c(400000,4480000), sb.scale= 100000)
## End(Not run)

##################################################
## 5) Block IDW interpolation and plot of 'EbroPPtsMonthly' for 3 months
## Not run: 
##D x.idw <- hydrokrige(x.ts= EbroPPtsMonthly, x.gis=EbroPPgis, 
##D                   X="EAST_ED50", Y="NORTH_ED50", sname="ID", 
##D                   bname="CHE_BASIN_NAME",
##D                   type= "cells", #'both'
##D                   subcatchments= EbroCatchmentsCHE,
##D                   cell.size= 3000,
##D                   ColorRamp= "Precipitation",
##D                   arrow.plot= TRUE, 
##D                   arrow.offset= c(900000,4750000), arrow.scale= 20000,
##D                   scalebar.plot= TRUE, 
##D                   sb.offset= c(400000,4480000), sb.scale= 100000,
##D                   dates=1, 
##D                   from="1942-01-01", to="1942-03-01")
## End(Not run)




