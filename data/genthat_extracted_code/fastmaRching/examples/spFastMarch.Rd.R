library(fastmaRching)


### Name: spFastMarch
### Title: Runs the spatial version of the Modified Fast Marching Method
### Aliases: spFastMarch

### ** Examples

library(raster); library(sp); library(rgdal)
domain <- raster(system.file("external/test.grd", package="raster")) # sample raster
domain <- domain > 0 # flattening elevation data
coords <- cbind(c(179000,181200), c(330000, 333000)) # coordinates for seeds
seed.df <- data.frame(incept=c(0,10), speed=c(.1,.1)) # incept time and speed for each seed
seeds <- SpatialPointsDataFrame(coords, seed.df, proj4string=crs(domain))

fm <- spFastMarch(domain, seeds)
par(mfrow=c(1,3))
plot(fm$process, main='process')
plot(fm$arrival.time, main='arrival time')
plot(fm$cost.distance, main='distance')



