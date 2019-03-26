library(rgbif)


### Name: count_facet
### Title: Facetted count occurrence search.
### Aliases: count_facet

### ** Examples

## Not run: 
##D # Select number of countries to facet on
##D count_facet(by='country', countries=3, removezeros = TRUE)
##D # Or, pass in country names
##D count_facet(by='country', countries='AR', removezeros = TRUE)
##D 
##D spplist <- c('Geothlypis trichas','Tiaris olivacea','Pterodroma axillaris',
##D              'Calidris ferruginea','Pterodroma macroptera',
##D              'Gallirallus australis',
##D              'Falco cenchroides','Telespiza cantans','Oreomystis bairdi',
##D              'Cistothorus palustris')
##D keys <- sapply(spplist,
##D   function(x) name_backbone(x, rank="species")$usageKey)
##D count_facet(keys, by='country', countries=3, removezeros = TRUE)
##D count_facet(keys, by='country', countries=3, removezeros = FALSE)
##D count_facet(by='country', countries=20, removezeros = TRUE)
##D 
##D # Pass in country names instead
##D countries <- isocodes$code[1:10]
##D count_facet(by='country', countries=countries, removezeros = TRUE)
##D 
##D # get occurrences by georeferenced state
##D ## across all records
##D count_facet(by='georeferenced')
##D 
##D ## by keys
##D count_facet(keys, by='georeferenced')
##D 
##D # by basisOfRecord
##D count_facet(by="basisOfRecord")
## End(Not run)



