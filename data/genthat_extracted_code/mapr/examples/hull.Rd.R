library(mapr)


### Name: hull
### Title: Add a convex hull to a map
### Aliases: hull

### ** Examples

# map spocc output, here using a built in object
data(occdat_eg1)
map_plot(occdat_eg1, hull = TRUE)

# map rgbif output, here using a built in object
hull(map_ggplot(occdat_eg1))

## Not run: 
##D # leaflet
##D library("spocc")
##D spp <- c('Danaus plexippus', 'Accipiter striatus', 'Pinus contorta')
##D dat <- occ(spp, from = 'gbif', limit = 30, has_coords = TRUE)
##D hull(map_leaflet(dat))
##D 
##D # ggplot
##D library("rgbif")
##D res <- occ_search(scientificName = "Puma concolor", limit = 100)
##D hull(map_ggplot(res))
##D 
##D # base plots
##D library("spocc")
##D out <- occ(query='Accipiter striatus', from='gbif', limit=25,
##D   has_coords=TRUE)
##D map_plot(out, hull = TRUE)
## End(Not run)



