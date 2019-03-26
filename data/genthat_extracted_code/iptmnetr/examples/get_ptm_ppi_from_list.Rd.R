library(iptmnetr)


### Name: get_ptm_ppi_from_list
### Title: Get post translational modification (PTM) depentdent
###   protein-protein interaction for the given list of kinases.
### Aliases: get_ptm_ppi_from_list

### ** Examples

## Not run: 
##D kinases = list(
##D   list(
##D       substrate_ac="Q15796",
##D       site_residue="K",
##D       site_position="19"
##D   ),
##D   list(
##D       substrate_ac="Q15796",
##D       site_residue="T",
##D       site_position="8"
##D  ),
##D  list(
##D       substrate_ac="P04637",
##D       site_residue="K",
##D       site_position="120"
##D  )
##D )
##D ptm_dep_ppi = get_ptm_ppi_from_list(kinases)
## End(Not run)



