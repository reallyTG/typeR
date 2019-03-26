library(RFOC)


### Name: MapNonDouble
### Title: Map moment tensors
### Aliases: MapNonDouble
### Keywords: misc

### ** Examples


## Not run: 
##D 
##D library(maps)
##D library(GEOmap)
##D 
##D ##########  load the data
##D data(widdenMoments)
##D 
##D #################   to read in the data from a file,
##D ##   GG = scan("widdenMoments.txt",sep=" ",
##D ## what=list(ID=0,Event="",Lat=0,Long=0,Depth=0,Mw=0,ML=0,DC=0,
##D ## CLVD=0,ISO=0,VR=0,nsta=0,Mxx=0,Mxy=0,Mxz=0,
##D ##  Myy=0,Myz=0,Mzz=0,Mo=0,Ftest=0) )
##D 
##D 
##D 
##D GG = widdenMoments
##D Locs = list(y=GG$Lat,x=GG$Long)
##D 
##D 
##D ef = 1e20
##D moments = cbind(GG$ID, ef*GG$Mxx, ef*GG$Myy,
##D ef*GG$Mzz, ef*GG$Myz, ef*GG$Mxz,ef*GG$Mxy)
##D 
##D 
##D 
##D 
##D UTAH =  map('state', region = c('utah'), plot=FALSE )
##D 
##D mlon = mean(UTAH$x, na.rm=TRUE)
##D mlat = mean(UTAH$y, na.rm=TRUE)
##D 
##D 
##D Gutah   = maps2GEOmap(UTAH)
##D 
##D 
##D ############   for mercator projection
##D PROJ =  GEOmap::setPROJ(type = 1, LAT0 = mlat , LON0 = mlon)
##D Glocs = GEOmap::GLOB.XY(Locs$y, Locs$x, PROJ       )
##D ############   for UTM projection
##D PROJ =  GEOmap::setPROJ(type = 2, LAT0 = mlat , LON0 = mlon)
##D Glocs = GEOmap::GLOB.XY(Locs$y, Locs$x, PROJ       )
##D 
##D LIMlat = expandbound(Gutah$POINTS$lat)
##D LIMlon = expandbound(Gutah$POINTS$lon)
##D 
##D PLAT =  pretty(LIMlat)
##D  PLON  = pretty(LIMlon)
##D 
##D ###############  plot the map
##D 
##D ########  Utah is a little rectangular
##D dev.new(width=9, height=12)
##D 
##D plotGEOmapXY(Gutah,
##D LIM = c(min(PLON), min(PLAT) , max(PLON) , max(PLAT)) ,
##D              PROJ=PROJ, axes=FALSE, xlab="", ylab="" )
##D 
##D 
##D ### add tic marks
##D kbox = GEOmap::GLOB.XY(PLAT,PLON, PROJ)
##D 
##D       sqrTICXY(kbox , PROJ, side=c(1,2,3,4), LLgrid=TRUE, col=grey(.7) )
##D 
##D ########  add focal mechs
##D siz = 0.2
##D 
##D MapNonDouble(Glocs, moments,col=NULL,  add=TRUE, LEG=TRUE)
##D 
##D   up = par("usr")
##D     ui = par("pin")
##D     ratx = (up[2] - up[1])/ui[1]
##D     raty = (up[4] - up[3])/ui[2]
##D usizx = siz * ratx
##D 
##D AXY = NoOverlap(Glocs$x,Glocs$y, usizx )
##D 
##D  MapNonDouble(AXY, moments,col=NULL,  add=TRUE, LEG=TRUE)
##D 
##D ####  MapNonDouble(NXY, moments,col=NULL,  add=TRUE, LEG=TRUE)
##D 
##D 
##D 
## End(Not run)




