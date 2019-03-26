library(dodgr)


### Name: dodgr_to_sfc
### Title: dodgr_to_sfc
### Aliases: dodgr_to_sfc

### ** Examples

hw <- weight_streetnet (hampi)
nrow(hw)
xy <- dodgr_to_sfc (hw)
dim (hw) # 5.845 edges
length (xy$geometry) # more linestrings aggregated from those edges
nrow (hampi) # than the 191 linestrings in original sf object
dim (xy$dat) # same number of rows as there are geometries
# sf::st_sf(xy$dat, geometry = xy$geometry, crs = 4326)



