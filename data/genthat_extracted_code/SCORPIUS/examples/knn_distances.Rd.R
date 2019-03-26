library(SCORPIUS)


### Name: knn_distances
### Title: k Nearest Neighbour distances
### Aliases: knn_distances

### ** Examples

## Calculate the kNN distances within a set of samples
x <- matrix(rnorm(50*10, mean=0, sd=1), ncol=10)
dist <- dist(x)
knnd <- knn_distances(dist, 10)
plot(density(knnd))

## Calculate the kNN distances between two sets of samples
y <- matrix(rnorm(100*10, mean=1, sd=2), ncol=10)
dist <- euclidean_distance(x, y)
knnd <- knn_distances(dist, 10)
plot(density(knnd))



