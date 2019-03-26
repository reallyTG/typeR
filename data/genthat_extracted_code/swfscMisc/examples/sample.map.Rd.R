library(swfscMisc)


### Name: sample.map
### Title: Plot Samples on World Map
### Aliases: sample.map

### ** Examples


# Some random points around San Diego, CA
lat <- runif(30, 32.5, 33.3)
lon <- runif(30, -118.3, -117.5)
lat.range <- c(32.4, 33.6)
lon.range <- c(-118.6, -117)
sample.map(lat, lon, lat.range, lon.range)

# Some random points in the Pacific
lat <- runif(30, 20, 50)
lon <- c(runif(15, 150, 180), runif(15, -180, -120))
lat.range <- c(10, 75)
lon.range <- c(110, -110)
sample.map(lat, lon, lat.range, lon.range)




