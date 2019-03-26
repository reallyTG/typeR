library(SCORPIUS)


### Name: knn
### Title: k Nearest Neighbour indices and distances
### Aliases: knn

### ** Examples

## Calculate the kNN distances within a set of samples
x <- matrix(rnorm(50*10, mean=0, sd=1), ncol=10)
dist <- dist(x)
knnd <- knn(dist, 10)
plot(density(knnd$distances))

## Calculate the kNN distances between two sets of samples
y <- matrix(rnorm(100*10, mean=1, sd=2), ncol=10)
dist <- euclidean_distance(x, y)
knnd <- knn(dist, 10)
plot(density(knnd$distances))



