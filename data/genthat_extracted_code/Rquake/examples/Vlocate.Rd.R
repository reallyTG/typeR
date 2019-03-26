library(Rquake)


### Name: Vlocate
### Title: Hypocenter Determination
### Aliases: Vlocate
### Keywords: misc

### ** Examples


## Not run: 
##D library(RSEIS)
##D data(GH)
##D 
##D g1 = GH$pickfile
##D 
##D data(VELMOD1D)
##D vel= VELMOD1D
##D 
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
##D 
##D wstart = which.min(Ldat$sec)
##D         EQ = list(lat=Ldat$lat[wstart], lon=Ldat$lon[wstart], z=6, t=Ldat$sec[wstart] )
##D       
##D 
##D   AQ = Vlocate(Ldat,EQ,vel, 
##D       distwt = 10,
##D       lambdareg =100 ,
##D       REG = TRUE,
##D       WTS = TRUE,
##D       STOPPING = TRUE,
##D       tolx =   0.01,
##D       toly = 0.01 ,
##D       tolz = 0.05, maxITER = c(7,5,7,4) , RESMAX = c(0.1, 0.1),  PLOT=FALSE)
## End(Not run)





