library(rgbif)


### Name: gbif_names
### Title: View highlighted terms in name results from GBIF.
### Aliases: gbif_names

### ** Examples

## Not run: 
##D # browse=FALSE returns path to file
##D gbif_names(name_lookup(query='snake', hl=TRUE), browse=FALSE)
##D 
##D (out <- name_lookup(query='canada', hl=TRUE, limit=5))
##D gbif_names(out)
##D gbif_names(name_lookup(query='snake', hl=TRUE))
##D gbif_names(name_lookup(query='bird', hl=TRUE))
##D 
##D # or not highlight
##D gbif_names(name_lookup(query='bird', limit=200))
## End(Not run)



