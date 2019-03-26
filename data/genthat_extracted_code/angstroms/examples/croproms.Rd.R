library(angstroms)


### Name: croproms
### Title: Crop a ROMS layer
### Aliases: croproms

### ** Examples

## notice that extent is in long-lat, but ice_local is in the grid
## space of ice_coords
ice_local <- croproms(ice_coords, extent(100, 120, -75, -60))
plot(ice_coords[[2]], col = grey(seq(0, 1, length  = 20)))
plot(crop(ice_fake, ice_local), add = TRUE)



