library(geosphere)


### Name: distVincentyEllipsoid
### Title: 'Vincenty' (ellipsoid) great circle distance
### Aliases: distVincentyEllipsoid
### Keywords: spatial

### ** Examples

distVincentyEllipsoid(c(0,0),c(90,90))
# on a 'Clarke 1880' ellipsoid
distVincentyEllipsoid(c(0,0),c(90,90), a=6378249.145, b=6356514.86955, f=1/293.465)



