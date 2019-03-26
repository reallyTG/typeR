library(GeoLight)


### Name: zenith
### Title: Solar Zenith Angle
### Aliases: zenith

### ** Examples

## Approx location of Sydney Harbour Bridge
lon <- 151.211
lat <- -33.852
## Solar zenith angle for noon on the first of May 2000
## at the Sydney Harbour Bridge
s <- solar(as.POSIXct("2000-05-01 12:00:00","EST"))
zenith(s,lon,lat)



