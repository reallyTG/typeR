library(GEOmap)


### Name: mapTeleSeis
### Title: World Map with Teleseismic Ray-paths
### Aliases: mapTeleSeis
### Keywords: misc

### ** Examples


## Not run: 
##D library(RSEIS)
##D library(GEOmap)
##D 
##D ################### 
##D ######   set up  stations
##D sta=list()
##D sta$'nam'=c("CAL", "KAM", "DOM", "LAV", "SMI", "CAS")
##D sta$'lat'=c(14.7421759974747,14.7471948493068,14.7422049415205,
##D 14.7204249827467,14.7543726234568,14.710961318972)
##D sta$'lon'=c(-91.5659793619529,-91.5698443123368,-91.5775586192333,
##D -91.5716896307798,-91.5518522222222,-91.5702146825397)
##D sta$'el'=c(2.37596727272727,2.29854436407474,2.31819590643275,
##D 1.64286335403727,3.65216666666667,1.44584353741497)
##D sta$'das'=c("CAL", "KAM", "DOM", "LAV", "SMI", "CAS")
##D sta$'sensor1'=c("60T", "60T", "60T", "40T", "INF", "3T")
##D sta$'comp1'=c("VNE", "VNE", "VNE", "VNE", "VNE", "VNE")
##D sta$'sensor2'=c("INF", "INF", "INF", "INF", "INF", "INF")
##D sta$'comp2'=c("IJK", "IJK", "IJK", "IJK", "IJK", "IJK")
##D sta$'dasSN'=c("9FF2", "9FFE", "9FFB", "9024", "A881", "9026")
##D sta$'sensorSN'=c("Unknown", "Unknown", "Unknown", "T41034", "Unknown", "T3A28")
##D sta$'start'=c("2008:366:16:02:59:615", "2008:366:20:50:18:615",
##D ######   "2008:366:00:58:23:849", 
##D "2008:365:23:01:21:315", "2008:366:23:57:10:244", "2008:365:20:47:51:529")
##D sta$'end'=c("2009:004:18:02:58:615", "2009:004:17:50:17:615",
##D ######   "2009:004:16:58:22:849", 
##D "2009:006:15:01:20:315", "2009:004:16:57:09:244", "2009:005:22:47:50:529")
##D sta$'name'=c("CAL", "KAM", "DOM", "LAV", "SMI", "CAS")
##D 
##D 
##D ##############   get earthquake epicenters
##D eq1=list()
##D eq1$'yr'=c(2008,2009,2009,2009,2008,2009,
##D 2009,2009,2009,2009,2009,2009,2009,2009,2009)
##D eq1$'mo'=c(12,1,1,1,12,1,1,1,1,1,1,1,1,1,1)
##D eq1$'dom'=c(30,1,3,4,30,1,2,3,3,3,3,3,4,4,6)
##D eq1$'lat'=c(14.06,14.73,13.93,15.23,-4.3,-34.84,0.62,-0.41,
##D -0.59,36.42,-0.32,-0.69,-0.4,36.44,-0.66)
##D eq1$'lon'=c(-92.21,-91.39,-91.74,-92.06,101.22,-107.65,-26.66,
##D 132.88,133.36,70.74,132.88,133.3,132.76,70.88,133.43)
##D eq1$'mag'=c(4.3,4.7,4,4.7,5.9,5.8,5.6,7.6,5.6,5.8,5.6,7.4,5.9,5.7,6)
##D eq1$'depth'=c(9,169,61,177,20,10,10,17,35,204,29,23,35,186,16)
##D eq1$'hr'=c(23,11,9,19,19,6,19,19,19,20,21,22,7,23,22)
##D eq1$'mi'=c(12,44,16,2,49,27,42,43,53,23,49,33,14,12,48)
##D eq1$'sec'=c(57,51.68,0.8,23,52.61,51.22,27.19,50.65,
##D 18.9,20.18,30.88,40.29,0.55,59.29,27.25)
##D eq1$'z'=c(9,169,61,177,20,10,10,17,35,204,29,23,35,186,16)
##D eq1$'jd'=c(365,1,3,4,365,1,2,3,3,3,3,3,4,4,6)
##D 
##D ##########################  use the projection that is derived from the 
##D ##########################    station file - these are based on the median station locations
##D  stinfo = list(mlat=median(sta$lat), mlon=median(sta$lon) )
##D 
##D proj =  setPROJ(6, LAT0=stinfo$mlat, LON0=stinfo$mlon )
##D 
##D 
##D ######   get distances - this is so we can separate regional from teleseismic events
##D eqdists = distaz(stinfo$mlat , stinfo$mlon, eq1$lat,  eq1$lon)
##D 
##D 
##D mylist = list()
##D for(j in 1:length(eq1$sec))
##D {
##D 
##D mylist[[j]] = list(yr=eq1$yr[j], jd=eq1$jd[j], mo=eq1$mo[j], dom=eq1$dom[j], hr=eq1$hr[j], 
##D mi=eq1$mi[j], sec=eq1$sec[j], lat=eq1$lat[j], lon=eq1$lon[j], z=eq1$z[j], mag=eq1$mag[j])
##D }
##D 
##D 
##D library(geomapdata)
##D      data(worldmap)
##D  mapTeleSeis(sta, mylist, worldmap=worldmap)
##D 
##D 
##D 
## End(Not run)








