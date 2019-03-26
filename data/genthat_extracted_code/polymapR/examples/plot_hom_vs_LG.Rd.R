library(polymapR)


### Name: plot_hom_vs_LG
### Title: Plot homologue position versus integrated positions
### Aliases: plot_hom_vs_LG

### ** Examples

data("integrated.maplist", "maplist_P1_subset")
colnames(integrated.maplist[["LG2"]]) <- c("marker", "position", "QTL_LOD")
plot_hom_vs_LG(map_df = integrated.maplist[["LG2"]],
               maplist_homologue = maplist_P1_subset[["LG2"]])



