library(dispRity)


### Name: nodes.coordinates
### Title: Nodes coordinates
### Aliases: nodes.coordinates

### ** Examples

## A random matrix
matrix <- matrix(rnorm(90), 9, 10)
## A random treee with node labels
tree <- rtree(5) ; tree$node.label <- paste0("n", 1:4)
## Adding the tip and node names to the matris
rownames(matrix) <- c(tree$tip.label, tree$node.label)

## Calculating the direct ancestral nodes
direct_anc_centroids <- nodes.coordinates(matrix, tree, full = FALSE)
## Calculating all the ancestral nodes
all_anc_centroids <- nodes.coordinates(matrix, tree, full = TRUE)

## Calculating the distances from the direct ancestral nodes
ancestral.dist(matrix, nodes.coords = direct_anc_centroids)
## Calculating the distances from all the ancestral nodes
ancestral.dist(matrix, nodes.coords = all_anc_centroids)




