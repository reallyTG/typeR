library(clusteval)


### Name: comembership
### Title: Calculates the comemberships of all pairs of a vector of
###   clustering labels.
### Aliases: comembership

### ** Examples

# We generate K = 3 labels for each of n = 10 observations and compute the
# comembership for all 'n choose 2' pairs.
set.seed(42)
K <- 3
n <- 10
labels <- sample.int(K, n, replace = TRUE)
comembership_out <- comembership(labels)
comembership_out

# Notice that the number of comemberships is 'n choose 2'.
length(comembership_out) == choose(n, 2)



