library(metR)


### Name: spherical
### Title: Transform between spherical coordinates and physical coordinates
### Aliases: spherical dlon dlat dx dy

### ** Examples


library(data.table)
data(geopotential)
geopotential <- geopotential[date == date[1]]

# Geostrophic wind
geopotential[, c("u", "v") := GeostrophicWind(gh, lon, lat)]  # in meters/second
geopotential[, c("dlon", "dlat") := .(dlon(u, lat), dlat(v))] # in degrees/second
geopotential[, c("u2", "v2") := .(dx(dlon, lat), dy(dlat))]   # again in degrees/second




