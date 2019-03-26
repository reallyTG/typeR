library(hydroTSM)


### Name: hydroTSM-package
### Title: Management, analysis, interpolation and plot of hydrological
###   time series, with focus on hydrological modelling
### Aliases: hydroTSM-package hydroTSM
### Keywords: package

### ** Examples

## Loading the monthly time series (10 years) of precipitation for the Ebro River basin.
data(EbroPPtsMonthly)

#######
## Ex1) Graphical correlation among the ts of monthly precipitation of the first 
##      3 stations in 'EbroPPtsMonthly' (its first column stores the dates).
hydropairs(EbroPPtsMonthly[,2:4])

#######
## Ex2) Annual values of precipitation at the station "P9001"
sname2ts(EbroPPtsMonthly, sname="P9001", dates=1, var.type="Precipitation", 
         tstep.out="annual")

#######
## Ex3) Monthly and annual plots
sname2plot(EbroPPtsMonthly, sname="P9001", var.type="Precipitation", pfreq="ma")

#######
## Ex4) IDW interpolation and plot

## Loading the spatial data corresponding to 'EbroPPtsMonthly'
data(EbroPPgis)

## Loading the shapefile (polygon) with the subcatchments
data(EbroCatchmentsCHE)

## Selecting the first day of 'EbroPPtsMonthly' for all the stations
x.ts <- as.numeric(EbroPPtsMonthly[1, 2:ncol(EbroPPtsMonthly)])

## Setting the name of the gauging stations
names(x.ts) <- colnames(EbroPPtsMonthly[1,2:ncol(EbroPPtsMonthly)])

# Computing the interpolated values and plotting them
# Probably you will need to resize your window
## Not run: 
##D x.idw <- hydrokrige(x.ts= x.ts, x.gis=EbroPPgis, 
##D                     X="EAST_ED50" , Y="NORTH_ED50" , sname="ID", 
##D                     bname= "CHE_BASIN_NAME", elevation="ELEVATION",
##D                     type= "both",
##D                     subcatchments= EbroCatchmentsCHE,
##D                     cell.size= 1000)
## End(Not run)

#######
## Ex5)  Mean monthly values of streamflows
## Loading daily streamflows (3 years) at the station 
## Oca en Ona (Ebro River basin, Spain)
data(OcaEnOnaQts)
monthlyfunction(OcaEnOnaQts, FUN=mean, na.rm=TRUE)




