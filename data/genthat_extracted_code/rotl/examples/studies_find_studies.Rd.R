library(rotl)


### Name: studies_find_studies
### Title: Find a Study
### Aliases: studies_find_studies

### ** Examples

## Not run: 
##D ## To match a study for which the identifier is already known
##D one_study <- studies_find_studies(property="ot:studyId", value="pg_719")
##D list_trees(one_study)
##D 
##D ## To find studies pertaining to Mammals
##D mammals <- studies_find_studies(property="ot:focalCladeOTTTaxonName",
##D                                 value="mammalia")
##D ## To extract the tree identifiers for each of the studies
##D list_trees(mammals)
##D ## ... or for a given study
##D list_trees(mammals, "ot_308")
##D 
##D ## Just the identifiers without other information about the studies
##D mammals <- studies_find_studies(property="ot:focalCladeOTTTaxonName",
##D                                 value="mammalia", detailed=FALSE)
## End(Not run)



