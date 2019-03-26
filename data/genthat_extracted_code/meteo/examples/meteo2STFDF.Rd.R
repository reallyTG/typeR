library(meteo)


### Name: meteo2STFDF
### Title: Create an object of STFDF class from two data frames
###   (observation and stations)
### Aliases: meteo2STFDF

### ** Examples

# prepare data
# load observation - data.frame of mean temperatures
data(dtempc) 
str(dtempc)
data(stations)
#
str(stations)
lonmin=18 ;lonmax=22.5 ; latmin=40 ;latmax=46
library(sp)
library(spacetime)
serbia = point.in.polygon(stations$lon, stations$lat, c(lonmin,lonmax,lonmax,lonmin), 
                          c(latmin,latmin,latmax,latmax))
st= stations[ serbia!=0, ] # stations in Serbia approx.
# create STFDF
temp <- meteo2STFDF(dtempc,st, crs= CRS('+proj=longlat +datum=WGS84'))
str(temp)





