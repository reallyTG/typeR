library(genotypeR)


### Name: Ref_Alt_Table
### Title: Make reference/alternate allele table from make_marker_names
###   output
### Aliases: Ref_Alt_Table
### Keywords: make_marker_names

### ** Examples


data(markers)
markers_in_study <- make_marker_names(markers)
genotype_table <- Ref_Alt_Table(markers_in_study = markers_in_study)




