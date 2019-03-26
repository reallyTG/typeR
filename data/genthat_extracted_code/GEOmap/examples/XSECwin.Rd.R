library(GEOmap)


### Name: XSECwin
### Title: Cross sectional plot with earthquakes projected
### Aliases: XSECwin
### Keywords: hplot iplot

### ** Examples


## Not run: 
##D  
##D library(geomapdata)
##D 
##D  data('japmap', package='geomapdata' )
##D proj = setPROJ(type = 2, LAT0=35.358,LON0=138.731)
##D 
##D NIHON = list(lat=range(c(japmap$STROKE$LAT1, japmap$STROKE$LAT2)) , 
##D              lon = range(c(japmap$STROKE$LON1, japmap$STROKE$LON2)))
##D 
##D 
##D xyjap = GLOB.XY(NIHON$lat, NIHON$lon, proj)
##D 
##D NIHON = c(NIHON, xyjap)
##D MAP = list()
##D MAP[[1]] = NIHON
##D attr(MAP, "XYLIM") <- NIHON
##D attr(MAP, "PROJ") <- proj
##D 
##D MAP[[2]] = japmap
##D 
##D ###########  load Engdahl earthquake Data base
##D ########  
##D data('EHB.LLZ' )
##D 
##D flagEHB = EHB.LLZ$lat>=NIHON$lat[1] &  EHB.LLZ$lat<=NIHON$lat[2] &
##D RPMG::fmod(EHB.LLZ$lon, 360)>+NIHON$lon[1] &  RPMG::fmod(EHB.LLZ$lon,
##D 360)<=NIHON$lon[2]
##D 
##D eqJ =   GLOB.XY(EHB.LLZ$lat[flagEHB], EHB.LLZ$lon[flagEHB], proj)
##D 
##D EQ =list()
##D EQ[[1]]=list(lat=EHB.LLZ$lat[flagEHB], lon=EHB.LLZ$lon[flagEHB] ,
##D x=eqJ$x, y=eqJ$y, z=EHB.LLZ$z[flagEHB], col="brown", pch=".", cex=1.5)
##D 
##D rz = NULL
##D for(i in 1:length(EQ))
##D {
##D rz = range(c(rz, EQ[[1]]$z), na.rm=TRUE )
##D 
##D }
##D 
##D for(i in 1:length(EQ))
##D {
##D iz = RPMG::RESCALE(EQ[[i]]$z, 1, 100, rz[1], rz[2])
##D EQ[[i]]$COL = rainbow(100)[iz]
##D }
##D 
##D labs=c("DONE","REFRESH", "XSEC", "MSEC",  "KMAXES", "CONT", "width",
##D "PS" )
##D ##  load example cross sections:
##D  data(NSWath)
##D NSWath2 = XSECEQ(  MAP, EQ ,XSECS=NSWath, labs, width=30, demo=TRUE  )
##D 
##D #######  show cross sections:
##D    for(i in 1:length(NSWath))
##D {
##D 
##D ## dev.new()
##D LAB = attr(NSWath[[i]], "LAB")
##D 
##D XSECwin( NSWath[[i]] , iseclab=i, xLAB=LAB , labs=NULL, demo=TRUE  )   
##D }
##D 
## End(Not run)



