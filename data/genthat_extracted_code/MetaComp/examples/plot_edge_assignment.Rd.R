library(MetaComp)


### Name: plot_edge_assignment
### Title: Generates a single column ggplot for a taxonomic assignment
###   table and also outputs a PDF.
### Aliases: plot_edge_assignment

### ** Examples

pa_fpath <- system.file("extdata", "HMP_even//allReads-pangia.list.txt", package="MetaComp")
pangia_assignment = load_edge_assignment(pa_fpath, type = "pangia")

plot_edge_assignment(pangia_assignment, "phylum", "Pangia", "HMP Even",
                                                     file.path(tempdir(), "assignment.pdf"))




