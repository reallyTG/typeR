library(sdmvspecies)


### Name: pickMedian
### Title: pickMedian
### Aliases: pickMedian

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
files <- list.files(path=env.dir, pattern="*.bil$", full.names=TRUE)
# make raster stack
env.stack <- stack(files)
# run pick mean
species.raster <- pickMedian(env.stack)
# plot map
plot(species.raster)



