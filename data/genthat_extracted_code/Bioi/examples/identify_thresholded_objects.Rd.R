library(Bioi)


### Name: identify_thresholded_objects
### Title: Assign all neighboring pixels the same group number.
### Aliases: identify_thresholded_objects

### ** Examples

# Generate a random matrix.
set.seed(10)
mat <- matrix(runif(70), nrow = 7)

# Arbitrarily say that everything below 0.8 is background.
mat[mat < 0.8] <- 0

# Find blobs.
identify_thresholded_objects(mat)




