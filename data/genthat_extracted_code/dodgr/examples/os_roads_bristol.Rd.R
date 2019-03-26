library(dodgr)


### Name: os_roads_bristol
### Title: os_roads_bristol
### Aliases: os_roads_bristol
### Keywords: datasets

### ** Examples

## Not run: 
##D library(sf)
##D library(dplyr)
##D os_roads <- sf::read_sf("~/data/ST_RoadLink.shp") # data must be unzipped here
##D u <- "https://opendata.arcgis.com/datasets/686603e943f948acaa13fb5d2b0f1275_4.kml"
##D lads <- sf::read_sf(u)
##D mapview::mapview(lads)
##D bristol_pol <- dplyr::filter(lads, grepl("Bristol", lad16nm))
##D os_roads <- st_transform(os_roads, st_crs(lads))
##D os_roads_bristol <- os_roads[bristol_pol, ] %>% 
##D   dplyr::filter(class == "Motorway" & roadNumber != "M32") %>% 
##D   st_zm(drop = TRUE)
##D mapview::mapview(os_roads_bristol)
## End(Not run)
# Converting this 'sf data.frame' to a 'dodgr' network requires manual
# specification of weighting profile:
colnm <- "formOfWay" # name of column used to determine weights
wts <- c (0.1, 0.2, 0.8, 1)
names (wts) <- unique (os_roads_bristol [[colnm]])
net <- weight_streetnet (os_roads_bristol, wt_profile = wts,
                         type_col = colnm, id_col = "identifier")
# 'id_col' tells the function which column to use to attribute IDs of ways



