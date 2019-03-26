library(spacetime)


### Name: ST-class
### Title: Class "ST"
### Aliases: ST-class xts-class zoo-class ST dim.ST
###   [[<-,ST,ANY,missing-method [[,ST,ANY,missing-method $<-,ST-method
###   $,ST-method cbind.ST is.projected,ST-method proj4string,ST-method
###   proj4string<-,ST,CRS-method proj4string<-,ST,character-method
###   geometry,ST-method
### Keywords: classes

### ** Examples

time = as.Date('2008-01-01')+1:2
library(sp)
sp = SpatialPoints(cbind(c(0,1),c(0,1)))
ST(sp, time, delta(time))



