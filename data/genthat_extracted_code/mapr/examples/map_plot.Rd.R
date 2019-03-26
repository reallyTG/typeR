library(mapr)


### Name: map_plot
### Title: Base R mapping
### Aliases: map_plot

### ** Examples

# map spocc output, here using a built in object
data(occdat_eg1)
map_plot(occdat_eg1)

# map rgbif output, here using a built in object
data(gbif_eg1)
map_plot(gbif_eg1)

## Not run: 
##D ## spocc
##D library("spocc")
##D (out <- occ(query='Accipiter striatus', from='gbif', limit=25,
##D   has_coords=TRUE))
##D ### class occdat
##D map_plot(out)
##D map_plot(out, hull = TRUE)
##D ### class occdatind
##D map_plot(out$gbif)
##D map_plot(out$gbif, hull = TRUE)
##D 
##D ## rgbif
##D library("rgbif")
##D ### occ_search() output
##D res <- occ_search(scientificName = "Puma concolor", limit = 100)
##D map_plot(res)
##D map_plot(res, hull = TRUE)
##D 
##D ### occ_data() output
##D res <- occ_data(scientificName = "Puma concolor", limit = 100)
##D map_plot(res)
##D #### many taxa
##D res <- occ_data(scientificName = c("Puma concolor", "Quercus lobata"), 
##D    limit = 30)
##D res
##D map_plot(res)
##D 
##D 
##D ## data.frame
##D df <- data.frame(
##D   name = c('Poa annua', 'Puma concolor', 'Foo bar', 'Stuff things'),
##D   longitude = c(-125, -123, -121, -110),
##D   latitude = c(41, 42, 45, 30), stringsAsFactors = FALSE)
##D map_plot(df)
##D map_plot(df, hull = TRUE)
##D 
##D ### usage of occ2sp()
##D #### SpatialPoints
##D spdat <- occ2sp(out)
##D map_plot(spdat)
##D map_plot(spdat, hull = TRUE)
##D 
##D #### SpatialPointsDataFrame
##D spdatdf <- as(spdat, "SpatialPointsDataFrame")
##D map_plot(spdatdf)
##D map_plot(spdatdf, hull = TRUE)
##D 
##D # many species, each gets a different color
##D library("spocc")
##D spp <- c('Danaus plexippus', 'Accipiter striatus', 'Pinus contorta',
##D   'Ursus americanus')
##D dat <- occ(spp, from = 'gbif', limit = 30, has_coords = TRUE,
##D   gbifopts = list(country = 'US'))
##D map_plot(dat)
##D map_plot(dat, hull = TRUE)
##D ## diff. color for each taxon
##D map_plot(dat, color = c('#976AAE', '#6B944D', '#BD5945', 'red'))
##D map_plot(dat, color = c('#976AAE', '#6B944D', '#BD5945', 'red'), hull = TRUE)
##D 
##D # add a convex hull
##D library("rgbif")
##D res <- occ_search(scientificName = "Puma concolor", limit = 100)
##D map_plot(res, hull = FALSE)
##D map_plot(res, hull = TRUE)
## End(Not run)



