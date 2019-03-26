library(MetaComp)


### Name: load_edge_assignment
### Title: Efficiently loads an EDGE-produced taxonomic assignment from a
###   file. An assumption has been made - since EDGE tables are generated
###   in an automated fashion, they should be properly formatted - thus the
###   code doesn't check for any inconsistencies except for the very file
###   existence. Note however, the unassigned to taxa entries are removed.
###   This implementation fully relies on the fread function from
###   data.table package gaining performance over traditional R techniques.
### Aliases: load_edge_assignment

### ** Examples

pa_fpath <- system.file("extdata", "HMP_even//allReads-pangia.list.txt", package="MetaComp")
pangia_assignment = load_edge_assignment(pa_fpath, type = "pangia")

table(pangia_assignment$LEVEL)

pangia_assignment[pangia_assignment$LEVEL == "phylum",]




