library(Rquake)


### Name: DoRLocate
### Title: Locate a set of picks in native R format
### Aliases: DoRLocate DoUWLocate
### Keywords: misc

### ** Examples


## Not run: 
##D 
##D ##########  read in list of pick data
##D LF = list.files(path="./Detail_picks", pat="RDATA", full=TRUE)
##D 
##D ###  read in station location file
##D fsta = "/home/lees/Site/CHAC/staLLZ.txt"
##D 
##D stas = scan(file=fsta,what=list(name="", lat=0, lon=0, z=0))
##D stas$z = stas$z/1000
##D 
##D ############  set the velocity (this vel is for a geothermal field in Califormia)
##D data(VELMOD1D)
##D vel= VELMOD1D
##D 
##D 
##D #############   calculate the locations: (use default values)
##D KAM = DoRLocate(LF, stas, vel)
##D 
##D 
##D ############  Done with earthquake locations....next pull data out of list
##D 
##D N = length(KAM)
##D 
##D H = list(lat=vector(length=N), lon=vector(length=N),
##D   z=vector(length=N), date=vector(length=N) ,   gap=vector(length=N),
##D herr =vector(length=N),
##D   zerr=vector(length=N),
##D   qual=vector(length=N))
##D 
##D 
##D 
##D for(i in 1:length(KAM))
##D   {
##D     zip = KAM[[i]]
##D     
##D     H$lat[i] = zip$EQ$lat
##D     H$lon[i] = zip$EQ$lon
##D     H$z[i] = zip$EQ$z
##D     H$date[i]  =     dateStamp(zip$EQ$Time)
##D     
##D     H$gap[i] = zip$ERR$gap
##D     H$herr[i] = zip$ERR$herr
##D     H$zerr[i] = zip$ERR$sterrz
##D     H$qual[i] = paste(zip$ERR$Q1, zip$ERR$Q2, sep="")
##D    
##D   }
##D 
##D 
##D data.frame(H)
##D 
##D 
##D MLAT = median(stas$lat)
##D MLON = median(stas$lon)
##D 
##D proj = GEOmap::setPROJ(type=2, LAT0=MLAT, LON0=MLON)
##D 
##D staxy = GEOmap::GLOB.XY(stas$lat, stas$lon, proj)
##D zq = GEOmap::GLOB.XY(H$lat, H$lon, proj)
##D 
##D plot(c(staxy$x, zq$x) , c(staxy$y, zq$y), type='n', xlab="E, km",
##D ylab="N, km", asp=1)
##D 
##D points(staxy, pch=6, col='red')
##D 
##D points(zq, pch=8, col='blue')
##D 
##D XYerror.bars(zq$x, zq$y, zq$y-H$herr/2, zq$y+H$herr/2,  zq$x-H$herr/2, zq$x+H$herr/2,
##D              pch = 1, col =1, barw = 0.05, add = TRUE )
##D 
##D #############  or: plot 95 percent confidence bounds
##D 
##D 
##D for(i in 1:length(KAM))
##D {
##D 
##D   zip = KAM[[i]]
##D  KOV = zip$ERR$cov[2:4, 2:4]
##D 
##D      eqlipse(zq$x[i], zq$y[i] , KOV,   wcols = c(1,2) , dof=zip$ERR$ndf, border="blue"  )
##D 
##D 
##D 
##D }
##D 
##D ######################################
##D ######################################   UW format data
##D ######################################
##D 
##D 
##D setwd("/home/lees/Progs/R_stuff/EARTHQUAKE")
##D 
##D 
##D stafile =  "coso_sta.LLZ"
##D 
##D staf = stafile
##D stas = setstas(stafile )
##D 
##D 
##D 
##D pdir = "/home/lees/Progs/R_stuff/EARTHQUAKE/pfiles"
##D LF = list.files(path=pdir, pattern="p$", full.names=TRUE )
##D 
##D KAM = DoUWLocate(LF, stas, vel)
##D 
##D 
##D 
##D 
## End(Not run)




