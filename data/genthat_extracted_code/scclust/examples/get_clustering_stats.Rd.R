library(scclust)


### Name: get_clustering_stats
### Title: Get clustering statistics
### Aliases: get_clustering_stats

### ** Examples

my_data_points <- data.frame(x = c(0.1, 0.2, 0.3, 0.4, 0.5,
                                   0.6, 0.7, 0.8, 0.9, 1.0),
                             y = c(10, 9, 8, 7, 6,
                                   10, 9, 8, 7, 6))

my_distances <- distances(my_data_points)

my_scclust <- scclust(c("A", "A", "B", "C", "B",
                        "C", "C", "A", "B", "B"))

get_clustering_stats(my_distances, my_scclust)

# >                     Value
# > num_data_points     10.0000000
# > num_assigned        10.0000000
# > num_clusters         3.0000000
# > min_cluster_size     3.0000000
# > max_cluster_size     4.0000000
# > avg_cluster_size     3.3333333
# > sum_dists           18.2013097
# > min_dist             0.5000000
# > max_dist             3.0066593
# > avg_min_dist         0.8366584
# > avg_max_dist         2.4148611
# > avg_dist_weighted    1.5575594
# > avg_dist_unweighted  1.5847484




