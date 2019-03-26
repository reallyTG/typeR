library(mapr)


### Name: map_ggplot
### Title: ggplot2 mapping
### Aliases: map_ggplot

### ** Examples

# map spocc output, here using a built in object
data(occdat_eg1)
map_ggplot(occdat_eg1)

# map rgbif output, here using a built in object
data(gbif_eg1)
map_ggplot(gbif_eg1)

## Not run: 
##D ## spocc
##D library("spocc")
##D ddat <- occ(query = 'Lynx rufus californicus', from = 'gbif', limit=100)
##D map_ggplot(ddat)
##D map_ggplot(ddat$gbif)
##D map_ggplot(v, "usa")
##D map_ggplot(ddat, "county")
##D 
##D ### usage of occ2sp()
##D #### SpatialPoints
##D spdat <- occ2sp(ddat)
##D map_ggplot(spdat)
##D #### SpatialPointsDataFrame
##D spdatdf <- as(spdat, "SpatialPointsDataFrame")
##D map_ggplot(spdatdf)
##D 
##D ## rgbif
##D library("rgbif")
##D library("ggplot2")
##D ### occ_search() output
##D res <- occ_search(scientificName = "Puma concolor", limit = 100)
##D map_ggplot(res)
##D 
##D ### occ_data() output
##D res <- occ_data(scientificName = "Puma concolor", limit = 100)
##D map_ggplot(res)
##D 
##D #### many taxa
##D res <- occ_data(scientificName = c("Puma concolor", "Quercus lobata"), 
##D    limit = 30)
##D map_ggplot(res)
##D 
##D ### add a convex hull
##D map_ggplot(res) + hull()
##D 
##D 
##D ## data.frame
##D df <- data.frame(name = c('Poa annua', 'Puma concolor', 'Foo bar'),
##D                  longitude = c(-120, -121, -121),
##D                  latitude = c(41, 42, 45), stringsAsFactors = FALSE)
##D map_ggplot(df)
##D 
##D # many species, each gets a different color
##D library("spocc")
##D spp <- c('Danaus plexippus', 'Accipiter striatus', 'Pinus contorta')
##D dat <- occ(spp, from = 'gbif', limit = 30, has_coords = TRUE)
##D map_ggplot(dat, color = c('#976AAE', '#6B944D', '#BD5945'))
## End(Not run)



