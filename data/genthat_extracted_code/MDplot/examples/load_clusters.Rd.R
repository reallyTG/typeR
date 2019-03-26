library(MDplot)


### Name: load_clusters
### Title: Loading cluster information
### Aliases: load_clusters
### Keywords: Clusters

### ** Examples

# GROMOS
load_clusters( system.file( "extdata/clusters_example.txt.gz", package = "MDplot" ) )

# GROMACS
load_clusters( system.file( "extdata/clusters_example_GROMACS.txt.gz", package = "MDplot" ),
               mdEngine = "GROMACS", lengths = c( 1001, 1001 ) )

# AMBER (first)
load_clusters( system.file( "extdata/clusters_example_1_AMBER.txt.gz", package = "MDplot" ),
               mdEngine = "AMBER" )

# AMBER (second)
load_clusters( system.file( "extdata/clusters_example_2_AMBER.txt.gz", package = "MDplot" ),
               mdEngine = "AMBER" )



