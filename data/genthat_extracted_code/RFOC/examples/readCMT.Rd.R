library(RFOC)


### Name: readCMT
### Title: Read Harvard CMT moment
### Aliases: readCMT
### Keywords: misc

### ** Examples


## Not run: 
##D Hcmt = readCMT("CMT_FULL_FORMAT.txt")
##D 
##D ########  or,
##D 
##D Hcmt = readCMT("CMT_FULL_FORMAT.txt", PLOT=FALSE)
##D 
##D  moments = matrix(ncol=7, nrow=length(Hcmt))
##D Locs = list(y=vector(length=length(Hcmt)) ,x=vector(length=length(Hcmt)))
##D 
##D 
##D for(i in 1:length(Hcmt))
##D {
##D P1 = Hcmt[[i]]
##D #########  Note the change of sign for cartesian coordinates
##D  moments[i,] = cbind(i, P1$Mtt, P1$Mpp, P1$Mrr,
##D         -P1$Mrp, P1$Mrt ,-P1$Mtp)
##D Locs$y[i] = P1$lat
##D Locs$x[i] = P1$lon
##D 
##D }
##D 
##D 
##D mlon = mean(Locs$x, na.rm=TRUE)
##D mlat = mean(Locs$y, na.rm=TRUE)
##D 
##D 
##D PROJ =  GEOmap::setPROJ(type = 1, LAT0 = mlat , LON0 = mlon)
##D Glocs = GEOmap::GLOB.XY(Locs$y, Locs$x, PROJ       )
##D 
##D 
##D LIMlat = expandbound(Locs$y)
##D LIMlon = expandbound(Locs$x)
##D 
##D PLAT =  pretty(LIMlat)
##D  PLON  = pretty(LIMlon)
##D 
##D data(worldmap)
##D par(xpd=FALSE)
##D 
##D plotGEOmapXY(worldmap, LIM = c(LIMlon[1],LIMlat[1] ,LIMlon[2],LIMlat[2]) ,
##D              PROJ=PROJ, axes=FALSE, xlab="", ylab="" )
##D 
##D ### add tic marks
##D kbox = GEOmap::GLOB.XY(PLAT,PLON, PROJ)
##D 
##D       sqrTICXY(kbox , PROJ, side=c(1,2,3,4), LLgrid=TRUE, col=grey(.7) )
##D 
##D ########  add focal mechs
##D 
##D MapNonDouble(Glocs, moments, col=NULL, add=TRUE)
##D 
##D 
##D 
## End(Not run)




