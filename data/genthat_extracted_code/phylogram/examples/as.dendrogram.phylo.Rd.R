library(phylogram)


### Name: as.dendrogram.phylo
### Title: Convert a "phylo" object to a dendrogram.
### Aliases: as.dendrogram.phylo

### ** Examples

  newick <- "(A:0.1,B:0.2,(C:0.3,D:0.4):0.5);"
  x <- read.dendrogram(text = newick)
  y <- as.phylo(x)
  z <- as.dendrogram(y)
  identical(x, z)



