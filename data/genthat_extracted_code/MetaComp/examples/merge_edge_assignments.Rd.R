library(MetaComp)


### Name: merge_edge_assignments
### Title: Merges two or more EDGE-like taxonomical assignments. The input
###   data frames are assumed to have the following columns: LEVEL, TAXA,
###   and ABUNDANCE - these will be used in the merge procedure, all other
###   columns will be ignored.
### Aliases: merge_edge_assignments

### ** Examples

## Not run: 
##D hmp_even_fp <- system.file("extdata", "HMP_even", package="MetaComp")
##D hmp_stagger_fp <- system.file("extdata", "HMP_stagger", package="MetaComp")
##D data_files <- data.frame(V1 = c("HMP_even", "HMP_stagger"),
##D                          V2 = c(file.path(hmp_even_fp, "allReads-gottcha2-speDB-b.list.txt"),
##D                                 file.path(hmp_stagger_fp, "allReads-gottcha2-speDB-b.list.txt")))
##D write.table(data_files, file.path(tempdir(), "assignments.txt"),
##D                                                  row.names = FALSE, col.names = FALSE)
##D gottcha2_assignments = merge_edge_assignments(
##D                          load_edge_assignments(
##D                            file.path(tempdir(), "assignments.txt"), type = "gottcha2"))
## End(Not run)




