library(polymapR)


### Name: create_phased_maplist
### Title: Create a phased homologue map list using the original dosages
### Aliases: create_phased_maplist

### ** Examples

data("integrated.maplist", "screened_data3", "marker_assignments_P1","marker_assignments_P2")
create_phased_maplist(integrated.maplist,
                     dosage_matrix.conv = screened_data3,
                     marker_assignment.1=marker_assignments_P1,
                     marker_assignment.2=marker_assignments_P2,
                     ploidy = 4)



