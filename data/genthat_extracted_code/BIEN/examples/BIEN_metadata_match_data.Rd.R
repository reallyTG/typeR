library(BIEN)


### Name: BIEN_metadata_match_data
### Title: Check for differing records between old and new dataframes.
### Aliases: BIEN_metadata_match_data

### ** Examples

## Not run: 
##D new<-BIEN_occurrence_species("Acer nigrum")
##D old<-new[-1:-4,]#simulate having an older dataset by removing four rows
##D BIEN_metadata_match_data(old,new,return="identical")
##D BIEN_metadata_match_data(old,new,return="additions")
## End(Not run)



