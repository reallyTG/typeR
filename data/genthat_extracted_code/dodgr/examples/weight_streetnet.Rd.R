library(dodgr)


### Name: weight_streetnet
### Title: weight_streetnet
### Aliases: weight_streetnet weight_streetnet.default weight_streetnet.sf
###   weight_streetnet.sc

### ** Examples

# hampi is included with package as an 'osmdata' sf-formatted street network
net <- weight_streetnet (hampi)
class(net) # data.frame
dim(net) # 6096  11; 6096 streets
# os_roads_bristol is also included as an sf data.frame, but in a different
# format requiring identification of columns and specification of custom
# weighting scheme.
colnm <- "formOfWay"
wts <- c (0.1, 0.2, 0.8, 1)
names (wts) <- unique (os_roads_bristol [[colnm]])
net <- weight_streetnet (os_roads_bristol, wt_profile = wts,
                         type_col = colnm, id_col = "identifier")
dim (net) # 406 11; 406 streets

# An example for a generic (non-OSM) highway, represented as the
# `routes_fast` object of the \pkg{stplanr} package, which is a
# SpatialLinesDataFrame.
## Not run: 
##D library (stplanr)
##D # merge all of the 'routes_fast' lines into a single network
##D r <- overline (routes_fast, attrib = "length", buff_dist = 1)
##D r <- sf::st_as_sf (r)
##D # We need to specify both a `type` and `id` column for the
##D # weight_streetnet function.
##D r$type <- 1
##D r$id <- seq (nrow (r))
##D graph <- weight_streetnet (r, type_col = "type", id_col = "id",
##D                            wt_profile = 1)
## End(Not run)



