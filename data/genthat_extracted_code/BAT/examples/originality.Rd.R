library(BAT)


### Name: originality
### Title: Phylogenetic/functional originality of species or individuals.
### Aliases: originality

### ** Examples

comm <- matrix(c(1,2,0,0,0,1,1,0,0,0,0,2,2,0,0,0,0,1,1,1), nrow = 4, byrow = TRUE)
distance <- dist(c(1:5), method="euclidean")
tree <- hclust(distance, method="average")
originality(tree = tree)
originality(distance = distance)
originality(comm, tree)
originality(comm, tree, abund = TRUE)
originality(comm, tree, abund = TRUE, relative = TRUE)



