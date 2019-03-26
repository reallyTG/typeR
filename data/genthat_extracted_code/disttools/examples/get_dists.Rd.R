library(disttools)


### Name: get_dists
### Title: Retrieve the distances between i and j from a 'dist' object.
### Aliases: get_dists

### ** Examples

test <- matrix(rnorm(20), ncol = 2)
test_dists <- dist(test)
indices <- matrix(sample(1:8),ncol=2)
get_dists(test_dists, indices)



