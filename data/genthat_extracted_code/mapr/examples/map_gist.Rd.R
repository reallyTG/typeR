library(mapr)


### Name: map_gist
### Title: Make an interactive map to view in the browser as a GitHub gist
### Aliases: map_gist

### ** Examples

## Not run: 
##D ## spocc
##D library("spocc")
##D spp <- c('Danaus plexippus', 'Accipiter striatus', 'Pinus contorta')
##D dat <- occ(spp, from=c('gbif','ecoengine'), limit=30,
##D   gbifopts=list(hasCoordinate=TRUE))
##D dat <- fixnames(dat, "query")
##D 
##D # Define colors
##D map_gist(dat, color=c('#976AAE','#6B944D','#BD5945'))
##D map_gist(dat$gbif, color=c('#976AAE','#6B944D','#BD5945'))
##D map_gist(dat$ecoengine, color=c('#976AAE','#6B944D','#BD5945'))
##D 
##D # Define colors and marker size
##D map_gist(dat, color=c('#976AAE','#6B944D','#BD5945'),
##D   size=c('small','medium','large'))
##D 
##D # Define symbols
##D map_gist(dat, symbol=c('park','zoo','garden'))
##D 
##D ## rgbif
##D library("rgbif")
##D ### occ_search() output
##D res <- occ_search(scientificName = "Puma concolor", limit = 100)
##D map_gist(res)
##D 
##D ### occ_data() output
##D res <- occ_data(scientificName = "Puma concolor", limit = 100)
##D map_gist(res)
##D 
##D #### many taxa
##D res <- occ_data(scientificName = c("Puma concolor", "Quercus lobata"), 
##D    limit = 30)
##D res
##D map_gist(res)
##D 
##D 
##D ## data.frame
##D df <- data.frame(name = c('Poa annua', 'Puma concolor', 'Foo bar'),
##D                  longitude = c(-120, -121, -121),
##D                  latitude = c(41, 42, 45), stringsAsFactors = FALSE)
##D map_gist(df)
##D 
##D ### usage of occ2sp()
##D #### SpatialPoints
##D spdat <- occ2sp(dat)
##D map_gist(spdat)
##D #### SpatialPointsDataFrame
##D spdatdf <- as(spdat, "SpatialPointsDataFrame")
##D map_gist(spdatdf)
## End(Not run)



