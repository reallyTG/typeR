library(MDplot)


### Name: load_clusters_ts
### Title: Loading timeseries cluster information
### Aliases: load_clusters_ts
### Keywords: Clusters

### ** Examples

# GROMOS
load_clusters_ts( system.file( "extdata/clusters_ts_example.txt.gz", package = "MDplot" ),
                  lengths = c( 4000, 4000, 4000, 4000, 4000, 4000 ) )

# GROMACS
load_clusters_ts( system.file( "extdata/clusters_example_GROMACS.txt.gz", package = "MDplot" ),
                  mdEngine = "GROMACS", lengths = c( 1001, 1001 ) )

# AMBER
load_clusters_ts( system.file( "extdata/clusters_ts_example_AMBER.txt.gz", package = "MDplot" ),
                  mdEngine = "AMBER", lengths = c( 50, 50 ) )



