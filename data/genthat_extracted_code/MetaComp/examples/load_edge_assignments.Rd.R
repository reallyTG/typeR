library(MetaComp)


### Name: load_edge_assignments
### Title: Efficiently loads a BWA (or other EDGE-like taxonomic
###   assignment) tables from a list of files. Outputs a named list of
###   assignments.
### Aliases: load_edge_assignments

### ** Examples

hmp_even_fp <- system.file("extdata", "HMP_even", package="MetaComp")
hmp_stagger_fp <- system.file("extdata", "HMP_stagger", package="MetaComp")
data_files <- data.frame(V1 = c("HMP_even", "HMP_stagger"),
                         V2 = c(file.path(hmp_even_fp, "allReads-gottcha2-speDB-b.list.txt"),
                                file.path(hmp_stagger_fp, "allReads-gottcha2-speDB-b.list.txt")))
write.table(data_files, file.path(tempdir(), "assignments.txt"),
                                                 row.names = FALSE, col.names = FALSE)
gottcha2_assignments = load_edge_assignments(file.path(tempdir(), "assignments.txt"),
                                                                            type = "gottcha2")

names(gottcha2_assignments)
table(gottcha2_assignments[[1]]$LEVEL)




