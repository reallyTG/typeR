library(rotl)


### Name: is_in_tree
### Title: Check that OTT ids occur in the Synthetic Tree
### Aliases: is_in_tree

### ** Examples

## Not run: 
##D   plant_families <- c("Asteraceae", "Solanaceae", "Poaceae", "Amaranthaceae",
##D                       "Zamiaceae", "Araceae", "Juncaceae")
##D   matched_names <- tnrs_match_names(plant_families)
##D   ## This fails because some ott ids are not in the tree
##D   ## plant_tree <- tol_induced_subtree(ott_id(matched_names))
##D   ## So let's check which ones are actually in the tree first:
##D   in_tree <- is_in_tree(ott_id(matched_names))
##D   ## This now works:
##D   plant_tree <- tol_induced_subtree(ott_id(matched_names)[in_tree])
## End(Not run)




