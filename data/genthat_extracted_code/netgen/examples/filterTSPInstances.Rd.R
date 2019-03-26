library(netgen)


### Name: filterTSPInstances
### Title: Filter TSPlib instances according to its specifications.
### Aliases: filterTSPInstances

### ** Examples

## Not run: 
##D # Get a data frame of instances and its properties for all instances
##D # with more than 4000 nodes
##D filterTSPInstances("path/to/instances", dimension > 4000)
##D 
##D # Now get only the full file names of all instances with edge weight type
##D # EUC_2D or CEIL_2D (see tsplib documentation for details)
##D filterTSPInstances("path/to/instances",
##D   expr = edge_weight_type %in% c("EUC_2D", "CEIL_2D"),
##D   paths.only = TRUE
##D )
## End(Not run)




