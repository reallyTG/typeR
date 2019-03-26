library(mapr)


### Name: map_leaflet
### Title: Make interactive maps with Leaflet.js
### Aliases: map_leaflet

### ** Examples

## Not run: 
##D ## spocc
##D library("spocc")
##D (out <- occ(query='Accipiter striatus', from='gbif', limit=50,
##D   has_coords=TRUE))
##D ### with class occdat
##D map_leaflet(out)
##D ### with class occdatind
##D map_leaflet(out$gbif)
##D ### use occ2sp
##D map_leaflet(occ2sp(out))
##D 
##D ## rgbif
##D library("rgbif")
##D res <- occ_search(scientificName = "Puma concolor", limit = 100)
##D map_leaflet(res)
##D 
##D ## SpatialPoints class
##D library("sp")
##D df <- data.frame(longitude = c(-120,-121),
##D                  latitude = c(41, 42), stringsAsFactors = FALSE)
##D x <- SpatialPoints(df)
##D map_leaflet(x)
##D 
##D ## SpatialPointsDataFrame class
##D library("rgbif")
##D ### occ_search() output
##D res <- occ_search(scientificName = "Puma concolor", limit = 100)
##D x <- res$data
##D library("sp")
##D x <- x[stats::complete.cases(x$decimalLatitude, x$decimalLongitude), ]
##D coordinates(x) <- ~decimalLongitude+decimalLatitude
##D map_leaflet(x)
##D 
##D ### occ_data() output
##D res <- occ_data(scientificName = "Puma concolor", limit = 100)
##D map_leaflet(res)
##D 
##D #### many taxa
##D res <- occ_data(scientificName = c("Puma concolor", "Quercus lobata"), 
##D    limit = 30)
##D res
##D map_leaflet(res)
##D 
##D 
##D ## data.frame
##D df <- data.frame(name = c('Poa annua', 'Puma concolor'),
##D                  longitude = c(-120,-121),
##D                  latitude = c(41, 42), stringsAsFactors = FALSE)
##D map_leaflet(df)
##D 
##D # many species
##D library("spocc")
##D spp <- c('Danaus plexippus', 'Accipiter striatus', 'Pinus contorta')
##D dat <- occ(spp, from = 'gbif', limit = 50, has_coords = TRUE)
##D map_leaflet(dat)
##D map_leaflet(dat, color = c('#AFFF71', '#AFFF71', '#AFFF71'))
##D map_leaflet(dat, color = c('#976AAE', '#6B944D', '#BD5945'))
##D 
##D # add a convex hull
##D ## map_leaflet(dat) %>% hull()  # using pipes
##D hull(map_leaflet(dat))
## End(Not run)



