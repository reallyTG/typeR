library(taxize)


### Name: nbn_classification
### Title: Search UK National Biodiversity Network database for taxonomic
###   classification
### Aliases: nbn_classification

### ** Examples

## Not run: 
##D nbn_classification(id="NHMSYS0000376773")
##D 
##D # get id first, then pass to this fxn
##D id <- get_nbnid("Zootoca vivipara", rec_only = TRUE, rank = "Species")
##D nbn_classification(id)
##D 
##D library('httr')
##D nbn_classification(id="NHMSYS0000502940", config=verbose())
## End(Not run)



