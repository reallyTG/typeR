library(argosfilter)


### Name: vmask
### Title: Filter locations for speed
### Aliases: vmask
### Keywords: spatial

### ** Examples

data(seal)
lat<-seal$lat
lon<-seal$lon
dtime<-seal$dtime
lc<-seal$lc

# filter by speed
mfilter<-vmask(lat,lon,dtime,2)

# plot unfiltered (grey) and filtered data (green)
plot(lon,lat,col="lightgrey",type="l",xlim=c(5,18), ylim=c(77.1,79.1),xlab="Longitude",ylab="Latitude")
lines(lon[which(mfilter=="not")],lat[which(mfilter=="not")],col="darkgreen")



