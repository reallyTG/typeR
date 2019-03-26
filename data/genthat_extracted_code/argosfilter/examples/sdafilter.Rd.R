library(argosfilter)


### Name: sdafilter
### Title: Filter Argos locations
### Aliases: sdafilter
### Keywords: spatial

### ** Examples

data(seal)
lat<-seal$lat
lon<-seal$lon
dtime<-seal$dtime
lc<-seal$lc

# plot unfiltered data
plot(lon,lat,col="lightgrey",type="l",xlim=c(5,18), ylim=c(77.1,79.1),xlab="Longitude",ylab="Latitude")

# filter by speed only
mfilter<-vmask(lat,lon,dtime,2)
mfilter[1:10]
lines(lon[which(mfilter=="not")],lat[which(mfilter=="not")],col="red")

# filter data using sdafilter
cfilter<-sdafilter(lat, lon, dtime, lc)
cfilter[1:20]
lines(lon[which(cfilter=="not")],lat[which(cfilter=="not")],col="blue")

# check number of locations (by location class) removed by each filter
table(lc,mfilter)
table(lc,cfilter)




