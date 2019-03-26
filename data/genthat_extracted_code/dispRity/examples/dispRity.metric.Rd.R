library(dispRity)


### Name: dispRity.metric
### Title: Disparity metrics
### Aliases: dispRity.metric dimension.level3.fun dimension.level2.fun
###   dimension.level1.fun variances ranges centroids mode.val
###   ellipse.volume convhull.surface convhull.volume diagonal
###   ancestral.dist pairwise.dist span.tree.length n.ball.volume radius

### ** Examples

## A dummy matrix
dummy_matrix <- matrix(rnorm(90), 10, 9)

## variances of a each column in the matrix
variances(dummy_matrix)
## variances of a each column in the matrix corrected using the kth root
variances(dummy_matrix, k.root = TRUE)

## ranges of each column in a matrix
ranges(dummy_matrix)
## ranges of each column in the matrix corrected using the kth root
ranges(dummy_matrix, k.root = TRUE)

## Distances between each row and centroid of the matrix
centroids(dummy_matrix)
## Distances between each row and an arbitrary point
centroids(dummy_matrix, centroid = c(1,2,3,4,5,6,7,8,9))
## Distances between each row and the origin
centroids(dummy_matrix, centroid = 0)

## Modal value of a vector
mode.val(rnorm(25))

## Ellipsoid volume of a matrix
ellipse.volume(dummy_matrix)
## WARNING: this is only valid without eigen vaues for MDS/PCO matrices.
## Use the correct eigen values for other types of matrices:
## Ordination
ordination <- prcomp(dummy_matrix)
## Calculating the ellipsoid volume
ellipse.volume(ordination$x, eigen.value = ordination$sdev^2)

## Convex hull hypersurface of a matrix
convhull.surface(dummy_matrix)

## Convex hull volume of a matrix
convhull.volume(dummy_matrix)


## Matrix diagonal
diagonal(dummy_matrix) # WARNING: only valid if the dimensions are orthogonal

## Minimum spanning tree length (default)
span.tree.length(dummy_matrix)

## Minimum spanning tree length from a distance matrix (faster)
distance <- as.matrix(dist(dummy_matrix))
span.tree.length(distance)

## Minimum spanning tree length based on Manhattan distance
span.tree.length(dummy_matrix, method = "manhattan")
span.tree.length(as.matrix(dist(dummy_matrix, method = "manhattan"))) # Same

## The maximal radius of each axis (maximum distance from centre of each axis)
radius(dummy_matrix)

## The average radius of each axis (mean distance from centre of each axis)
radius(dummy_matrix, type = mean)

## The pairwise distance
pairwise.dist(dummy_matrix)

## The average squared pairwise distance
mean(pairwise.dist(dummy_matrix)^2)

## equal to:
geiger::disparity(data = dummy_matrix)

## A random matrix
dummy_matrix <- matrix(rnorm(90), 9, 10)
## A random treee with node labels
rand_tree <- rtree(5) ; rand_tree$node.label <- paste0("n", 1:4)
## Adding the tip and node names to the matris
rownames(dummy_matrix) <- c(rand_tree$tip.label, rand_tree$node.label)

## Calculating the direct ancestral nodes
direct_anc_centroids <- nodes.coordinates(dummy_matrix, rand_tree, full = FALSE)
## Calculating all the ancestral nodes
all_anc_centroids <- nodes.coordinates(dummy_matrix, rand_tree, full = TRUE)

## Calculating the distances from the direct ancestral nodes
ancestral.dist(dummy_matrix, nodes.coords = direct_anc_centroids)
## Calculating the distances from all the ancestral nodes
ancestral.dist(dummy_matrix, nodes.coords = all_anc_centroids)




