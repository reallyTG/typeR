library(spex)


### Name: latmask
### Title: Latitude mask for polar raster
### Aliases: latmask

### ** Examples

 
library(raster)
plot(latmask(ice, -60))
plot(latmask(ice, -60, trim = TRUE))
ice[!ice > 0] <- NA
plot(ice)
plot(latmask(ice, -55, trim = TRUE))



