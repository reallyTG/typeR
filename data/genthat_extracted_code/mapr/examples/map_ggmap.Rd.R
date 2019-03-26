library(mapr)


### Name: map_ggmap
### Title: ggpmap visualization of species occurences
### Aliases: map_ggmap

### ** Examples

## Not run: 
##D # BEWARE: this may error for you with a message like
##D # "GeomRasterAnn was built with an incompatible version of ggproto".
##D # This is fixed in the dev version of `ggmap`, but not in the CRAN
##D # version. Apologies for the problem.
##D 
##D ## spocc
##D library("spocc")
##D gd <- occ(query = 'Accipiter striatus', from = 'gbif', limit=75,
##D   has_coords = TRUE)
##D map_ggmap(gd)
##D map_ggmap(gd$gbif)
##D 
##D ## rgbif
##D library("rgbif")
##D ### occ_search() output
##D res <- occ_search(scientificName = "Puma concolor", limit = 100)
##D map_ggmap(res)
##D 
##D ### occ_data() output
##D res <- occ_data(scientificName = "Puma concolor", limit = 100)
##D map_ggmap(res)
##D 
##D #### many taxa
##D res <- occ_data(scientificName = c("Puma concolor", "Quercus lobata"), 
##D    limit = 30)
##D map_ggmap(res)
##D 
##D 
##D ## data.frame
##D df <- data.frame(name = c('Poa annua', 'Puma concolor', 'Foo bar'),
##D                  longitude = c(-120, -121, -123),
##D                  latitude = c(41, 42, 45), stringsAsFactors = FALSE)
##D map_ggmap(df)
##D 
##D ### usage of occ2sp()
##D #### SpatialPointsDataFrame
##D spdat <- occ2sp(gd)
##D map_ggmap(spdat)
##D 
##D # many species, each gets a different color
##D library("spocc")
##D spp <- c('Danaus plexippus', 'Accipiter striatus', 'Pinus contorta')
##D dat <- occ(spp, from = 'gbif', limit = 30, has_coords = TRUE,
##D   gbifopts = list(country = 'US'))
##D map_ggmap(dat)
##D map_ggmap(dat, zoom = 5)
##D map_ggmap(dat, color = '#6B944D')
##D map_ggmap(dat, color = c('#976AAE', '#6B944D', '#BD5945'))
## End(Not run)



