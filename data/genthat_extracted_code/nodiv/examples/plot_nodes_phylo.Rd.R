library(nodiv)


### Name: plot_nodes_phylo
### Title: Plot a phylogeny with colored node labels
### Aliases: plot_nodes_phylo
### Keywords: ~kwd1 ~kwd2

### ** Examples

data(coquettes)
Clade_occupancy <- Node_occupancy(coquettes)
plot_nodes_phylo(Clade_occupancy, coquettes$phylo, cex = 0.7)



