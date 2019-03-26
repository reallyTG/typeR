library(angstroms)


### Name: romscoords
### Title: Extract coordinate arrays from ROMS.
### Aliases: romscoords

### ** Examples

## Not run: 
##D   coord <- romscoord("roms.nc")
## End(Not run)
## with in-built fake data
plot(ice_fake, asp = 0.5)
contour(ice_coords[[1]], add = TRUE, levels = seq(-165, 165, by = 15))
contour(ice_coords[[2]], add = TRUE)




