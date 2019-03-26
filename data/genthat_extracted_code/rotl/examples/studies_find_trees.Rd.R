library(rotl)


### Name: studies_find_trees
### Title: Find Trees
### Aliases: studies_find_trees

### ** Examples

## Not run: 
##D res <- studies_find_trees(property="ot:ottTaxonName", value="Drosophilia",
##D                           detailed=FALSE)
##D ## summary of the trees and associated studies that match this criterion
##D res
##D ## With metadata about the studies (default)
##D res <- studies_find_trees(property="ot:ottTaxonName", value="Drosophilia",
##D                           detailed=TRUE)
##D ## The list of trees for each study that match the search criteria
##D list_trees(res)
##D ## the trees for a given study
##D list_trees(res, study_id = "pg_2769")
## End(Not run)



