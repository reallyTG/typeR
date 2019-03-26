library(Rquake)


### Name: eqlipse
### Title: Error Elipse for Hypocenter Location
### Aliases: eqlipse
### Keywords: misc

### ** Examples

## Not run: 
##D library(RSEIS)
##D data(GH)
##D data(wu_coso.vel)
##D vel = wu_coso.vel
##D 
##D 
##D gpf = GH$pickfile
##D 
##D w1 = which(gpf$STAS$phase=="P" | gpf$STAS$phase=="S" )
##D 
##D N = length(w1)
##D 
##D  Ldat =    list(
##D       name = gpf$STAS$name[w1],
##D       sec = gpf$STAS$sec[w1],
##D       phase = gpf$STAS$phase[w1],
##D       lat=gpf$STAS$lat[w1],
##D       lon = gpf$STAS$lon[w1],
##D       z = gpf$STAS$z[w1],
##D       err= gpf$STAS$err[w1],
##D       yr = rep(gpf$LOC$yr , times=N),
##D       jd = rep(gpf$LOC$jd, times=N),
##D       mo = rep(gpf$LOC$mo, times=N),
##D       dom = rep(gpf$LOC$dom, times=N),
##D       hr =rep( gpf$LOC$hr, times=N),
##D       mi = rep(gpf$LOC$mi, times=N) )
##D 
##D EQ = GH$pickfile$LOC
##D 
##D EQ$t = EQ$sec
##D 
##D kuality = eqwrapup(Ldat, EQ, vel, distwt = 20, verbose = TRUE )
##D 
##D 
##D  MLAT = median(Ldat$lat)
##D   MLON = median(Ldat$lon)
##D   proj = GEOmap::setPROJ(type=2, LAT0=MLAT, LON0=MLON)
##D 
##D   XYSTAS = GEOmap::GLOB.XY(Ldat$lat,  Ldat$lon , proj)
##D 
##D 
##D  eqxy = GEOmap::GLOB.XY(EQ$lat, EQ$lon, proj)
##D 
##D 
##D plot(range(c(XYSTAS$x, eqxy$x)), range(c(XYSTAS$y, eqxy$y)), type='n', asp=1, xlab="km", ylab="km" )
##D points(XYSTAS$x, XYSTAS$y, pch=6)
##D points(eqxy$x, eqxy$y, pch=8, col='red')
##D 
##D 
##D KOV = kuality$cov[2:4, 2:4]
##D 
##D eqlipse(eqxy$x, eqxy$y , KOV,   wcols = c(1,2) , dof=kuality$ndf, border="blue"  )
##D 
## End(Not run)



