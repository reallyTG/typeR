library(scclust)


### Name: sc_clustering
### Title: Size-constrained clustering
### Aliases: sc_clustering
### Keywords: cluster

### ** Examples

# Make example data
my_data <- data.frame(id = 1:50000,
                      type = factor(rbinom(50000, 3, 0.3),
                                    labels = c("A", "B", "C", "D")),
                      x1 = rnorm(50000),
                      x2 = rnorm(50000),
                      x3 = rnorm(50000))

# Construct distance metric
my_dist <- distances(my_data,
                     id_variable = "id",
                     dist_variables = c("x1", "x2", "x3"))

# Make clustering with at least 3 data points in each cluster
my_clustering <- sc_clustering(my_dist, 3)

# Check so clustering satisfies constraints
check_clustering(my_clustering, 3)
# > TRUE

# Get statistics about the clustering
get_clustering_stats(my_dist, my_clustering)
# > num_data_points        5.000000e+04
# > ...

# Make clustering with at least one point of each type in each cluster
my_clustering <- sc_clustering(my_dist,
                               type_labels = my_data$type,
                               type_constraints = c("A" = 1, "B" = 1,
                                                    "C" = 1, "D" = 1))

# Check so clustering satisfies constraints
check_clustering(my_clustering,
                 type_labels = my_data$type,
                 type_constraints = c("A" = 1, "B" = 1,
                                      "C" = 1, "D" = 1))
# > TRUE

# Make clustering with at least 8 points in total of which at least
# one must be "A", two must be "B" and five can be any type
my_clustering <- sc_clustering(my_dist,
                               size_constraint = 8,
                               type_labels = my_data$type,
                               type_constraints = c("A" = 1, "B" = 2))




