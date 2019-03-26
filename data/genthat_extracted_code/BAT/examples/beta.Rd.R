library(BAT)


### Name: beta
### Title: Beta diversity (Taxon, Phylogenetic or Functional Diversity -
###   TD, PD, FD).
### Aliases: beta

### ** Examples

comm <- matrix(c(2,2,0,0,0,1,1,0,0,0,0,2,2,0,0,0,0,0,2,2), nrow = 4, ncol = 5, byrow = TRUE)
tree <- hclust(dist(c(1:5), method="euclidean"), method="average")
beta(comm)
beta(comm, func = "Soerensen")
beta(comm, tree)
beta(comm, raref = 1)
beta(comm, tree, abund = TRUE, "s", raref = 2)



