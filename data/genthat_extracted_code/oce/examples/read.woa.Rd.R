library(oce)


### Name: read.woa
### Title: Read a World Ocean Atlas NetCDF File
### Aliases: read.woa

### ** Examples

## Not run: 
##D ## Mean SST at 5-degree spatial resolution
##D tmn <- read.woa("/data/woa13/woa13_decav_t00_5dv2.nc", "t_mn")
##D imagep(tmn$longitude, tmn$latitude, tmn$t_mn[,,1], zlab="SST")
## End(Not run)



