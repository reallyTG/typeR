library(RFOC)


### Name: xsecmanyfoc
### Title: Plot Focal Mechs at X-Y position on cross sections
### Aliases: xsecmanyfoc
### Keywords: misc

### ** Examples


############# create and  plot the mechs in plan view:
N = 20
lon=runif(20, 235, 243)
     lat=runif(20, 45.4, 49)
     str1=runif(20,50,100)
     dip1=runif(20,10, 80)
     rake1=runif(20,5, 180)

     dep=runif(20,1,15)
     name=seq(from=1, to=length(lon), by=1)
     Elat=NULL
     Elon=NULL
yr = rep(2017, times=N)
jd = runif(N, min=1, max=365)

      MEKS = list(lon=lon, lat=lat, str1=str1, dip1=dip1,
 rake1=rake1, dep=dep, name=name, yr=yr, jd = jd)

     PROJ = GEOmap::setPROJ(type=2, LAT0=mean(lat) , LON0=mean(lon) )   ##   utm

     XY = GEOmap::GLOB.XY(lat, lon, PROJ)

     plot(range(XY$x), range(XY$y), type='n', asp=1)

     plotmanyfoc(MEKS, PROJ, focsiz=0.5)

ex = range(XY$x)
why = range(XY$y)


JJ = list(x=ex, y=why)


SWA = GEOmap::eqswath(XY$x, XY$y, MEKS$dep, JJ, width = diff(why) , PROJ = PROJ)


MEKS$x = rep(NA, length(XY$x))
MEKS$y = rep(NA, length(XY$y))


MEKS$x[SWA$flag] = SWA$r
MEKS$y[SWA$flag] = -SWA$depth
bigR = sqrt(  (JJ$x[2]-JJ$x[1])^2 + (JJ$y[2]-JJ$y[1])^2)

plot(c(0,bigR)   , c(0, min(-SWA$depth)) , type='n',
 xlab="Distance, KM", ylab="Depth")
points(SWA$r, -SWA$depth)

xsecmanyfoc(MEKS, focsiz=0.5,  LEG = TRUE, DOBAR=FALSE)
title("cross section: focals are plotted as if in plan view")


ang1 = atan2( JJ$y[2]-JJ$y[1] , JJ$x[2]-JJ$x[1])

 degang =  ang1*180/pi


xsecmanyfoc(MEKS, focsiz=0.5, theta=degang, LEG = TRUE, DOBAR=FALSE)
title("cross section: focals are view from the side projection (outer hemisphere)")








