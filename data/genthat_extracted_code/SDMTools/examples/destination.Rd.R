library(SDMTools)


### Name: destination
### Title: Vincenty Direct Calculation of a Destination
### Aliases: destination

### ** Examples

###single lat lons
lats = -85; lons = 165
#single bearing & single distance
destination(lats,lons,bearing=180,distance=500000)

#multiple bearings
destination(lats,lons,bearing=seq(0,360,length.out=9),distance=500000)

#multiple bearings
destination(lats,lons,bearing=45,distance=seq(0,5000000,length.out=11))

#multiple bearings, multiple distances
destination(lats,lons,bearing=seq(0,360,length.out=9),
    distance=seq(0,5000000,length.out=11))

###multiple lat lons
lats = seq(-90,90,length.out=9); lons = seq(-180,180,length.out=9)

#multiple lat lons but single bearings / distances
destination(lats,lons,bearing=45,distance=500000)

#different bearings for each lat lon
destination(lats,lons,bearing=seq(0,360,length.out=9),distance=500000)

#different distances for each lat lon
destination(lats,lons,bearing=45,distance=seq(0,5000000,length.out=9))

#different bearings & distances for each lat lon
destination(lats,lons,bearing=seq(0,360,length.out=9),
    distance=seq(0,5000000,length.out=9))



