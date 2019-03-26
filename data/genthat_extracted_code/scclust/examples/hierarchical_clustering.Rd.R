library(scclust)


### Name: hierarchical_clustering
### Title: Hierarchical size-constrained clustering
### Aliases: hierarchical_clustering
### Keywords: cluster

### ** Examples

# Make example data
my_data <- data.frame(x1 = rnorm(10000),
                      x2 = rnorm(10000),
                      x3 = rnorm(10000))

# Construct distance metric
my_dist <- distances(my_data)

# Make clustering with `sc_clustering`
my_clustering <- sc_clustering(my_dist, 3)

# Refine clustering with `hierarchical_clustering`
my_refined_clustering <- hierarchical_clustering(my_dist,
                                                 size_constraint = 3,
                                                 existing_clustering = my_clustering)

# Make clustering from scratch with `hierarchical_clustering`
my_other_clustering <- hierarchical_clustering(my_dist, 3)




