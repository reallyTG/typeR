library(fields)


### Name: Colorado Monthly Meteorological Data
### Title: Monthly surface meterology for Colorado 1895-1997
### Aliases: COmonthlyMet CO.elev CO.id CO.loc CO.names CO.ppt CO.ppt.MAM
###   CO.tmax CO.tmax.MAM CO.tmin CO.tmin.MAM CO.years CO.ppt.MAM.climate
###   CO.tmax.MAM.climate CO.tmean.MAM.climate CO.tmin.MAM.climate
###   CO.elevGrid CO.Grid
### Keywords: datasets

### ** Examples


data(COmonthlyMet)

#Spatial plot of 1997 Spring average daily maximum temps
 quilt.plot( CO.loc,CO.tmax.MAM[103,]  )
 US( add=TRUE)
 title( "Recorded MAM max temperatures (1997)")

# min and max temperatures against elevation

matplot( CO.elev, cbind( CO.tmax.MAM[103,], CO.tmin.MAM[103,]),
  pch="o", type="p",
  col=c("red", "blue"), xlab="Elevation (m)", ylab="Temperature (C)")
title("Recorded MAM max (red) and min (blue) temperatures 1997")

#Fitting a spatial model:
obj<- Tps(CO.loc,CO.tmax.MAM.climate,  Z= CO.elev )
good<- !is.na(CO.tmax.MAM.climate )
out<- MLE.Matern(CO.loc[good,],CO.tmax.MAM.climate[good], 
          smoothness=1.0, Z= CO.elev[good] )
#MLE search on range suggests Tps model           





