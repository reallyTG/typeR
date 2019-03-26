library(VFS)


### Name: USC00368449.dly
### Title: GHCN Data for State College, PA, 1980-2009
### Aliases: USC00368449.dly
### Keywords: datasets

### ** Examples

# A sample DLY file for State College, PA, is included with this package.
# This file contains a subset of data (1980-2009) for station USC00368449
#
weather <- read.dly(system.file("extdata", "USC00368449.dly", package = "VFS"))
# identical to data("weather")



