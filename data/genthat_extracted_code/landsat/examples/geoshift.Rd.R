library(landsat)


### Name: geoshift
### Title: Shift and pad an image
### Aliases: geoshift
### Keywords: spatial utilities

### ** Examples


testmat <- matrix(1:9, 3, 3)
geoshift(testmat, 5, 10, 0, 0)
geoshift(testmat, 5, 10, 2, 2)

# to use for georeferencing
data(nov3)
data(july3)
july.shift <- georef(nov3, july3, maxdist=50) # match july to november
july3.corr <- geoshift(july3, padx=50, pady=50, july.shift$shiftx, july.shift$shifty)

# only need to run georef once for a particular date
# use the same correction for all bands
data(july4)
july4.corr <- geoshift(july4, padx=50, pady=50, july.shift$shiftx, july.shift$shifty)





