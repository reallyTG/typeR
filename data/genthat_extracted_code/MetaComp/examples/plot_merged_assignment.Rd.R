library(MetaComp)


### Name: plot_merged_assignment
### Title: Generates a single column ggplot for a taxonomic assignment
###   table.
### Aliases: plot_merged_assignment

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
##D plot_merged_assignment(gottcha2_assignments, "family", 'alphabetical', 100, 0,
##D                                        "HMP side-to-side", file.path(tempdir(), "assignment.pdf"))
## End(Not run)




