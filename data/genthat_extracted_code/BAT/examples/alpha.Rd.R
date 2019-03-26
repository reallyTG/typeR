library(BAT)


### Name: alpha
### Title: Alpha diversity (Taxon, Phylogenetic or Functional Diversity -
###   TD, PD, FD).
### Aliases: alpha

### ** Examples

comm <- matrix(c(0,0,1,1,0,0,2,1,0,0), nrow = 2, ncol = 5, byrow = TRUE)
tree <- hclust(dist(c(1:5), method="euclidean"), method="average")
alpha(comm)
alpha(comm, raref = 0)
alpha(comm, tree, 2, 100)



