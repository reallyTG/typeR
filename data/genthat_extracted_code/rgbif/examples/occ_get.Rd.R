library(rgbif)


### Name: occ_get
### Title: Get data for specific GBIF occurrences.
### Aliases: occ_get

### ** Examples

## Not run: 
##D occ_get(key=855998194, return="data")
##D occ_get(key=855998194, "hier")
##D occ_get(key=855998194, 'all')
##D 
##D # many occurrences
##D occ_get(key=c(101010, 240713150, 855998194), return="data")
##D 
##D # Verbatim data
##D occ_get(key=855998194, verbatim=TRUE)
##D occ_get(key=855998194, fields='all', verbatim=TRUE)
##D occ_get(key=855998194, fields=c('scientificName', 'lastCrawled', 'county'),
##D   verbatim=TRUE)
##D occ_get(key=c(855998194, 620594291), verbatim=TRUE)
##D occ_get(key=c(855998194, 620594291), fields='all', verbatim=TRUE)
##D occ_get(key=c(855998194, 620594291),
##D    fields=c('scientificName', 'decimalLatitude', 'basisOfRecord'),
##D    verbatim=TRUE)
##D 
##D # Pass in curl options
##D occ_get(key=855998194, curlopts = list(verbose=TRUE))
## End(Not run)



