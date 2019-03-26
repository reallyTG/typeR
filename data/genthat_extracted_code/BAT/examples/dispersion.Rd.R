library(BAT)


### Name: dispersion
### Title: Phylogenetic/functional dispersion of species or individuals.
### Aliases: dispersion

### ** Examples

comm <- matrix(c(1,2,0,0,0,1,1,0,0,0,0,2,2,0,0,0,0,1,1,1), nrow = 4, byrow = TRUE)
distance <- dist(c(1:5), method="euclidean")
tree <- hclust(distance, method="average")
dispersion(tree = tree)
dispersion(distance = distance)
dispersion(comm, tree)
dispersion(comm, tree, abund = TRUE)
dispersion(comm, tree, abund = TRUE, relative = TRUE)



