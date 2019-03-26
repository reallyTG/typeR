library(ddpcr)


### Name: unanalyzed_clusters
### Title: Get unanalyzed cluseter IDs
### Aliases: unanalyzed_clusters
### Keywords: internal

### ** Examples

## Not run: 
##D plate <- new_plate(sample_data_dir())
##D unanalyzed_clusters(plate, 3)
##D unanalyzed_clusters(plate, cluster(plate, "OUTLIER"))
##D plate %>% unanalyzed_clusters(cluster(plate, "OUTLIER")) %>% cluster_name(plate, .)
## End(Not run)



