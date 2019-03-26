library(Bioi)


### Name: find_blobs
### Title: Assign all neighboring pixels the same group number.
### Aliases: find_blobs

### ** Examples

# Generate a random matrix.
set.seed(10)
mat <- matrix(runif(70), nrow = 7)

# Arbitrarily say that everything below 0.8 is background.
logical_mat <- mat > 0.8

# Find blobs.
find_blobs(logical_mat)




