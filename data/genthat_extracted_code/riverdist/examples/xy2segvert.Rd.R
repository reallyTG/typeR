library(riverdist)


### Name: xy2segvert
### Title: Convert XY Coordinates to River Locations
### Aliases: xy2segvert

### ** Examples

data(Gulk,fakefish)
head(fakefish)

fakefish.riv <- xy2segvert(x=fakefish$x, y=fakefish$y, rivers=Gulk)
head(fakefish.riv)

plot(x=Gulk, xlim=c(862000,882000), ylim=c(6978000,6993000))
points(fakefish$x, fakefish$y, pch=16, col=2)
riverpoints(seg=fakefish.riv$seg, vert=fakefish.riv$vert, rivers=Gulk, pch=15, col=4)


## converting a matrix of points stored in long-lat to Alaska Albers Equal Area:
data(line98, Kenai1)
head(line98)  # note that coordinates are stored in long-lat, NOT lat-long

library(rgdal)
line98albers <- project(line98,proj="+proj=aea +lat_1=55 +lat_2=65 
    +lat_0=50 +lon_0=-154 +x_0=0 +y_0=0 +datum=NAD83 +units=m +no_defs 
    +ellps=GRS80 +towgs84=0,0,0")
head(line98albers)

zoomtoseg(seg=c(162,19), rivers=Kenai1)
points(line98albers)



