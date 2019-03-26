library(polymapR)


### Name: finish_linkage_analysis
### Title: Linkage analysis between all markertypes within LG.
### Aliases: finish_linkage_analysis

### ** Examples

## Not run: 
##D data("screened_data3", "marker_assignments_P1")
##D linkages_list_P1<-finish_linkage_analysis(marker_assignment=marker_assignments_P1,
##D                                               dosage_matrix=screened_data3,
##D                                               target_parent="P1",
##D                                               other_parent="P2",
##D                                               convert_palindrome_markers=FALSE,
##D                                               ploidy=4,
##D                                               pairing="random",
##D                                               LG_number=5)
##D                                               
## End(Not run)



