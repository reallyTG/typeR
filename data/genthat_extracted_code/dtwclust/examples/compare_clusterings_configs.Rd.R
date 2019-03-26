library(dtwclust)


### Name: compare_clusterings_configs
### Title: Create clustering configurations.
### Aliases: compare_clusterings_configs

### ** Examples


# compare this with leaving no.expand empty
compare_clusterings_configs(
    distances = pdc_configs("d", dtw_basic = list(window.size = 1L:2L, norm = c("L1", "L2"))),
    centroids = pdc_configs("c", dba = list(window.size = 1L:2L, norm = c("L1", "L2"))),
    no.expand = c("window.size", "norm")
)




