library(sdmvspecies)


### Name: artificialBellResponse
### Title: artificialBellResponse
### Aliases: artificialBellResponse

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
file.name <- files <- c("bio1.bil", "bio12.bil", "bio7.bil", "bio5.bil")
files <- paste(env.dir, file.name, sep="")
# make raster stack
env.stack <- stack(files)
# config
config <- list(c("bio1",150, 50), c("bio12", 2000, 500), c("bio7", 400, 100), c("bio5", 300, 100))
# run pick mean
species.raster <- artificialBellResponse(env.stack, config)
# plot map
plot(species.raster)
# species distribution map
species.distribution.raster <- species.raster > 0.2
# plot map
plot(species.distribution.raster)



