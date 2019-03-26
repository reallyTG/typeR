library(RFOC)


### Name: spherefocgeo
### Title: SphereFocGeo
### Aliases: spherefocgeo
### Keywords: misc

### ** Examples



N = 100
LATS = c(7.593004,  25.926045)
LONS = c(268.1563 , 305)
lon=rnorm(N, mean=mean(LONS), sd=diff(LONS)/2 )
lat=rnorm(N, mean=mean(LATS), sd=diff(LATS)/2)

str1=runif(N,50,100)
dip1=runif(N,10, 80)
rake1=runif(N,5, 180)


dep=runif(N,1,15)
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

  points(XY$x, XY$y)
spherefocgeo(MEKS, PROJ, PLOT=TRUE, icut = 3, ndivs = 4,
 add=TRUE, pal=terrain.colors(100), RECT=TRUE )







## Not run: 
##D 
##D plot(x=range(IZ$x), y=range(IZ$y), type='n', asp=1, axes=FALSE, ann=FALSE)
##D 
##D image(x=IZ$x, y=IZ$y, z=(UZ), col=blues, add=TRUE)
##D 
##D image(x=IZ$x, y=IZ$y, z=(AZ), col=terrain.colors(100) , add=TRUE)
##D 
##D 
##D  plotGEOmapXY(haiti.map,
##D               LIM = c(Lon.range[1],Lat.range[1] ,
##D Lon.range[2] ,Lat.range[2]),
##D               PROJ =PROJ, MAPstyle = 2,
##D  MAPcol = 'black' , add=TRUE  )
##D 
##D H = rectPERIM(JMAT$xo, JMAT$yo)
##D 
##D 
##D antipolygon(H$x ,H$y,   col=grey(.85)  , corner=1, pct=.4)
##D 
##D sqrTICXY(H , PROJ, side=c(1,2,3,4),   LLgrid=TRUE, col=grey(.7) )
##D 
##D 
##D spherefocgeo(OLDCMT, PROJ, PLOT=TRUE, add=TRUE, pal=topo.colors(100) )
##D 
##D 
##D 
## End(Not run)








