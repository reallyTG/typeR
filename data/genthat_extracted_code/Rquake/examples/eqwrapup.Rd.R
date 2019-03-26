library(Rquake)


### Name: eqwrapup
### Title: Earthquake Wrap Uo
### Aliases: eqwrapup
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
##D names(kuality)
## End(Not run)






