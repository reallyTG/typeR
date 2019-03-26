library(elevatr)


### Name: get_elev_point
### Title: Get Point Elevation
### Aliases: get_elev_point

### ** Examples

## Not run: 
##D mt_wash <- data.frame(x = -71.3036, y = 44.2700)
##D mt_mans <- data.frame(x = -72.8145, y = 44.5438)
##D mts <- rbind(mt_wash,mt_mans)
##D ll_prj <- "+proj=longlat +ellps=WGS84 +datum=WGS84 +no_defs"
##D mts_sp <- sp::SpatialPoints(sp::coordinates(mts), 
##D                             proj4string = sp::CRS(ll_prj)) 
##D get_elev_point(locations = mt_wash, prj = ll_prj)
##D get_elev_point(locations = mt_wash, units="feet", prj = ll_prj)
##D get_elev_point(locations = mt_wash, units="meters", prj = ll_prj)
##D get_elev_point(locations = mts_sp)
## End(Not run)



