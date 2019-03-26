library(Rquake)


### Name: Klocate
### Title: Earthquake Hypocenter Location
### Aliases: Klocate
### Keywords: misc

### ** Examples


## Not run: 
##D 
##D LF = list.files(path=pdir, pattern="p$", full.names=TRUE )
##D 
##D GYPSY2 = vector(mode="list")
##D 
##D for(i in 1:length(LF))
##D   {
##D     g1 = getpfile( LF[i], sta=staf ) 
##D     ##  points(g1$H$lon, g1$H$lat, pch=8, col='red')
##D 
##D     w1 = which(!is.na(g1$STAS$lat))
##D     sec = g1$STAS$sec[w1]
##D 
##D     N = length(sec)
##D     Ldat =    list(
##D       name = g1$STAS$name[w1],
##D       sec = g1$STAS$sec[w1],
##D       phase = g1$STAS$phase[w1],
##D       lat=g1$STAS$lat[w1],
##D       lon = g1$STAS$lon[w1],
##D       z = g1$STAS$z[w1],
##D       err= g1$STAS$err[w1],
##D       yr = rep(g1$LOC$yr , times=N),
##D       jd = rep(g1$LOC$jd, times=N),
##D       mo = rep(g1$LOC$mo, times=N),
##D       dom = rep(g1$LOC$dom, times=N),
##D       hr =rep( g1$LOC$hr, times=N),
##D       mi = rep(g1$LOC$mi, times=N) )
##D 
##D  
##D     NEW = Klocate(Ldat, sol=c(MYLOC$y, MYLOC$x, 6, 0) )
##D 
##D     GYPSY2[[i]] = NEW
##D     
##D  
##D   }
##D 
##D 
## End(Not run)





