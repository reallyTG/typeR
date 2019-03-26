library(phylogram)


### Name: as.phylo.dendrogram
### Title: Convert a dendrogram to a "phylo" object.
### Aliases: as.phylo.dendrogram

### ** Examples

  newick <- "(A:0.1,B:0.2,(C:0.3,D:0.4):0.5);"
  x <- read.dendrogram(text = newick)
  y <- as.phylo(x)
  z <- as.dendrogram(y)



