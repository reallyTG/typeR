library(nprotreg)


### Name: get_skew_symmetric_matrix
### Title: Gets a 3-by-3 Skew Symmetric Matrix.
### Aliases: get_skew_symmetric_matrix

### ** Examples

library(nprotreg)

# Define a vector of independent components.

independent_components <- cbind(1, 2, 3)

# Get the corresponding 3-by-3 skew symmetric matrix.

m <- get_skew_symmetric_matrix(independent_components)



