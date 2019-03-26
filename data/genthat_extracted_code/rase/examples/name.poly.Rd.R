library(rase)


### Name: name.poly
### Title: Name & Order Polygons According to the Phylogeny
### Aliases: name.poly

### ** Examples

  # attach polygon data
  data(rase_data, package = 'rase')

  ## Not run: 
##D     # polygons already in format used by rase.
##D     psophia_poly
##D 
##D     # check the phylogenetic tree
##D     psophia_tree
##D 
##D     # Species names of polygons (in order)
##D     pnames <- c('dextralis', 'viridis', 'leucoptera', 'interjecta', 
##D       'obscura', 'crepitans', 'ochroptera', 'napensis')
##D 
##D     # check tree's' tip labels
##D     psophia_tree$tip.label
##D 
##D     # name the polygons
##D     polygons <- name.poly(psophia_poly, psophia_tree, poly.names = pnames)
##D   
## End(Not run)



