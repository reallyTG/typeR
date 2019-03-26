library(Rquake)


### Name: XYlocate
### Title: Locate Earthquake with UTM projection
### Aliases: XYlocate
### Keywords: misc

### ** Examples

## Not run: 
##D library(RSEIS)
##D data(GH)
##D 
##D g1 = GH$pickfile
##D data(VELMOD1D)
##D vel= VELMOD1D
##D 
##D 
##D 
##D  w1 = which(!is.na(g1$STAS$lat))
##D          sec = g1$STAS$sec[w1]
##D 
##D          N = length(sec)
##D          Ldat =    list(
##D            name = g1$STAS$name[w1],
##D            sec = g1$STAS$sec[w1],
##D            phase = g1$STAS$phase[w1],
##D            lat=g1$STAS$lat[w1],
##D            lon = g1$STAS$lon[w1],
##D            z = g1$STAS$z[w1],
##D            err= g1$STAS$err[w1],
##D            yr = rep(g1$LOC$yr , times=N),
##D            jd = rep(g1$LOC$jd, times=N),
##D            mo = rep(g1$LOC$mo, times=N),
##D            dom = rep(g1$LOC$dom, times=N),
##D            hr =rep( g1$LOC$hr, times=N),
##D            mi = rep(g1$LOC$mi, times=N) )
##D 
##D  MLAT = median(Ldat$lat)
##D     MLON = median(Ldat$lon)
##D     
##D     proj = GEOmap::setPROJ(type=2, LAT0=MLAT, LON0=MLON)
##D 
##D ####   get station X-Y values in km
##D     XY = GEOmap::GLOB.XY(Ldat$lat, Ldat$lon, proj)
##D ###   add to Ldat list
##D     Ldat$x = XY$x
##D     Ldat$y = XY$y
##D        wstart = which.min(Ldat$sec)
##D 
##D 
##D 
##D EQ = list(x=XY$x[wstart], y=XY$y[wstart], z=6, t=Ldat$sec[wstart] )
##D 
##D       
##D  maxITER = 7
##D ###print(EQ)
##D     AQ = XYlocate(Ldat,EQ,vel, 
##D       maxITER = maxITER,
##D       distwt = 1,
##D       lambdareg =10 ,
##D       FIXZ = FALSE,
##D       REG = TRUE,
##D       WTS = TRUE,
##D       STOPPING = TRUE,
##D       RESMAX = c(0.1,0.1),
##D       tolx =   0.001,
##D       toly = 0.001 ,
##D       tolz = 0.5, PLOT=FALSE)
##D 
##D ########  update the new location
##D 
##D AXY = GEOmap::XY.GLOB(AQ$EQ$x, AQ$EQ$y, proj)
##D AQ$EQ$lat = AXY$lat
##D AQ$EQ$lon = AXY$lon
##D if(AQ$EQ$lon>180) { AQ$EQ$lon = AQ$EQ$lon-360 }
##D 
##D 
##D plot(c(Ldat$x, AQ$EQ$x) , c(Ldat$y,AQ$EQ$y), type='n' , xlab="km",
##D ylab="km" )
##D 
##D points(Ldat$x, Ldat$y, pch=6)
##D 
##D points(AQ$EQ$x, AQ$EQ$y, pch=8, col='red')
##D 
##D points(EQ$x, EQ$y, pch=4, col='blue')
##D 
##D 
##D legend("topright", pch=c(8,4, 6), col=c("red", "blue", "black"),
##D  legend=c("Final location", "Initial guess", "Station"))
##D 
##D 
##D print(AQ)
##D 
##D EQ$x = 10
##D EQ$y = 2
##D 
## End(Not run)






