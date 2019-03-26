library(skyscapeR)


### Name: mag.dec
### Title: Estimates magnetics declination (diff. between true and magnetic
###   north) based on IGRF 12th gen model
### Aliases: mag.dec

### ** Examples

# Magnetic Declination for London on April 1st 2016:
london.lat <- 51.5074 #N
london.lon <- -0.1278 #W
loc <- c( london.lat, london.lon )
mag.dec( loc, "2016/04/01" )



