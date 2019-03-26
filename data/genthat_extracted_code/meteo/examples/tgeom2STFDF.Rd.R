library(meteo)


### Name: tgeom2STFDF
### Title: Calculate geometrical temperature trend
### Aliases: tgeom2STFDF

### ** Examples

library(sp)
library(spacetime)
## create one point from lon lat
pos <- SpatialPoints(coords = cbind(19.22,45.33)) 
## temp_geom for 1st Jan 2011
tg1 <- tgeom2STFDF(pos,as.POSIXct("2011-01-01") )  
tg1

## temp_geom for the 2011 at pos location
tg365<- tgeom2STFDF(pos,time = seq(as.POSIXct("2011-01-01"), as.POSIXct("2011-12-31"), 
                    by="day") ) 
stplot(tg365, mode='ts')

data(regdata) 
## DEM and TWI data for Serbia at 1 km resolution
# str(regdata@sp)
spplot(regdata@sp, zcol='dem', col.regions=bpy.colors() )

## temp_geom for Serbia 1st and 2nd Jully 2011
tgSrb<- tgeom2STFDF(regdata@sp,time = seq(as.POSIXct("2011-07-01"), 
                    as.POSIXct("2011-07-02"), by="day") ) 

## temp_geom for "2011-07-01" , "2011-07-02"
# stplot(tgSrb, col.regions = bpy.colors() ) 




