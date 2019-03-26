library(BAT)


### Name: uniqueness
### Title: Phylogenetic/functional uniqueness of species.
### Aliases: uniqueness

### ** Examples

comm <- matrix(c(1,2,0,0,0,1,1,0,0,0,0,2,2,0,0,0,0,1,1,1), nrow = 4, byrow = TRUE)
distance <- dist(c(1:5), method="euclidean")
tree <- hclust(distance, method="average")
uniqueness(tree = tree)
uniqueness(distance = distance)
uniqueness(comm, tree)
uniqueness(comm, tree, relative = TRUE)



