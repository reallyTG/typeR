library(ade4)


### Name: newick.eg
### Title: Phylogenetic trees in Newick format
### Aliases: newick.eg
### Keywords: datasets

### ** Examples

data(newick.eg)
newick2phylog(newick.eg[[11]])
radial.phylog(newick2phylog(newick.eg[[7]]), circ = 1,
 clabel.l = 0.75)



