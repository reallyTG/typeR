library(MDplot)


### Name: clusters_ts
### Title: Cluster timeseries plot
### Aliases: clusters_ts
### Keywords: clusters_ts

### ** Examples

# GROMOS (see load_clusters_ts() for other input possibilities)
clusters_ts( load_clusters_ts( system.file( "extdata/clusters_ts_example.txt.gz",
                               package = "MDplot" ),
                               lengths = c( 4000, 4000, 4000, 4000, 4000, 4000 ) ),
             clustersNumber = 7 )



