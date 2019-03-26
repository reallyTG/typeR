library(jcext)


### Name: extended_jc
### Title: extended_jc
### Aliases: extended_jc

### ** Examples


# Load data
data(press)
# Get coordinates
longitudes <- press$loni
latitudes  <- press$lati
times      <- press$dates

# Example when the classification is restricted to an area
# Select longitudes and latitudes within the European domain: -10W,40E, 40N,70N
ilon  <- which(longitudes>(-10)&longitudes<40)
loni  <- longitudes[ilon]
ilat  <- which(latitudes>40&latitudes<70)
lati  <- latitudes[ilat]
cwtEU <- extended_jc(press$msl[ilon,ilat,], loni, lati, times, gale=FALSE, num_cores=2)
 ## Not run: 
##D # Not run
##D # This is a long running example
##D # Get the classification for the whole map, all longitudes and latitudes
##D cwtGlobal <- extended_jc(press$msl, longitudes, latitudes, times, gale=FALSE, num_cores=2)
## End(Not run)




