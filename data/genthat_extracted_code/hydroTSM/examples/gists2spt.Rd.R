library(hydroTSM)


### Name: gists2spt
### Title: Time Series and GIS Info -> (pseudo)Spatio-Temporal Object
### Aliases: gists2spt
### Keywords: manip

### ** Examples

############
## Loading the monthly time series of precipitation within the Ebro River basin.
data(EbroPPtsMonthly)

## Loading the gis data
data(EbroPPgis)    

## Putting the measurements of the first row of 'EbroPPtsMonthly' into their 
## corresponding spatial location given by 'x.gis'
require(sp)
x.spt <- gists2spt(x.ts=EbroPPtsMonthly[1,], x.gis=EbroPPgis, X="EAST_ED50", 
                   Y="NORTH_ED50", na.rm=FALSE, sname="ID")

## Plotting the measured values (only the first row of 'EbroPPtsMonthly') at their 
## corresponding spatial location
spplot(x.spt, zcol="value")



