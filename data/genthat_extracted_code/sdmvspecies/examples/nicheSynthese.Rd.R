library(sdmvspecies)


### Name: nicheSynthese
### Title: nicheSynthese
### Aliases: nicheSynthese

### ** Examples

# load the sdmvspecies library
library("sdmvspecies")
library("raster")
# find package's location
package.dir <- system.file(package="sdmvspecies")
# let see where is our sdmvspecies is installed in
package.dir
# find env dir under the package's location
env.dir <- paste(package.dir, "/external/env/", sep="")
# let see env dir
env.dir
# get the environment raster file
env.files <- list.files(env.dir, pattern="*.bil$", full.names=TRUE)
# see the file list
env.files
# put the environment file in a raster stack,
# which require all the environment should have same resolution and extend
env.stack <- stack(env.files)
# let see the env.stack var
env.stack
# here let's configure the environment response function and weight
config <- list(
    c("bio1","1",2),
    c("bio14", "2", 2),
    c("bio5", "3", 1),
    c("bio11", "4", 2),
    c("bio16", "5", 1)
)
# call the niche synthsis method
species.raster <- nicheSynthese(env.stack, config)
# let see the result raster,
# you should noticed that it's continue value map not distributin map
species.raster

# write the map to file, so you can use it latter in GIS software
# or further analysis.
#
#writeRaster(species.raster, "synthese.img", "HFA", overwrite=TRUE)

# to make binary distribution map, you should chosee a threshold to make map
# see the map then to decide the threshold to binary
plot(species.raster)
# choice threshold, here we choice 4
threshold <- 14
# make binary map
distribution.map <- species.raster > threshold
# plot the map out
plot(distribution.map)



