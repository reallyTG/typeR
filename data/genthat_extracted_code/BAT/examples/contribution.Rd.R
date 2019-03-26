library(BAT)


### Name: contribution
### Title: Contribution of species or individuals to total
###   phylogenetic/functional diversity.
### Aliases: contribution

### ** Examples

comm <- matrix(c(1,2,0,0,0,1,1,0,0,0,0,2,2,0,0,0,0,1,1,1), nrow = 4, byrow = TRUE)
tree <- hclust(dist(c(1:5), method="euclidean"), method="average")
contribution(tree = tree)
contribution(comm, tree)
contribution(comm, tree, TRUE)
contribution(comm, tree, abund = TRUE, relative = TRUE)



