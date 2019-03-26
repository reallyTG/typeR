library(phylogram)


### Name: write.dendrogram
### Title: Write a dendrogram object to parenthetic text.
### Aliases: write.dendrogram

### ** Examples

  newick <- "(A:0.1,B:0.2,(C:0.3,D:0.4):0.5);"
  x <- read.dendrogram(text = newick)
  write.dendrogram(x, edges = TRUE)



