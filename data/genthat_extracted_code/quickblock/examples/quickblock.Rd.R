library(quickblock)


### Name: quickblock
### Title: Construct threshold blockings
### Aliases: quickblock

### ** Examples

# Construct example data
my_data <- data.frame(x1 = runif(100),
                      x2 = runif(100))

# Make distances
my_distances <- distances(my_data, dist_variables = c("x1", "x2"))

# Make blocking with at least two units in each block
quickblock(my_distances)

# Require at least three units in each block
quickblock(my_distances, size_constraint = 3)

# Impose caliper
quickblock(my_distances, caliper = 0.2)

# Break large block
quickblock(my_distances, break_large_blocks = TRUE)

# Call `quickblock` directly with covariate data (ie., not pre-calculating distances)
quickblock(my_data[c("x1", "x2")])

# Call `quickblock` directly with covariate data using Mahalanobis distances
quickblock(my_data[c("x1", "x2")], normalize = "mahalanobize")




