library(landsat)


### Name: georef
### Title: Simple image-matching georeferencing function.
### Aliases: georef
### Keywords: spatial utilities

### ** Examples

# to use for georeferencing
data(nov3)
data(july3)
july.shift <- georef(nov3, july3, maxdist=50) # match july to november
july3.corr <- geoshift(july3, padx=50, pady=50, july.shift$shiftx, july.shift$shifty)

# only need to run georef once for a particular date
# use the same correction for all bands
data(july4)
july4.corr <- geoshift(july4, padx=50, pady=50, july.shift$shiftx, july.shift$shifty)




