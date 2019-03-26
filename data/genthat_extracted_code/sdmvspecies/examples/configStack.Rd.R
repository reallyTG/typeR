library(sdmvspecies)


### Name: configStack
### Title: configStack
### Aliases: configStack

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
config <- list(c("bio1", "1", 0, 100), c("bio11", "2", -100, NULL))
env.stack <- configStack(env.stack, config)
plot(env.stack)



