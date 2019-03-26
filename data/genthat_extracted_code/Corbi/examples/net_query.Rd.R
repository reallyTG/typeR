library(Corbi)


### Name: net_query
### Title: Network querying method based on conditional random fields
### Aliases: net_query net_query net_query_batch

### ** Examples


## Not run: 
##D library(Corbi)
##D 
##D ## An example: "querynet.txt", "targetnet.txt", "nodesim.txt" are
##D ## three input files in the working directory
##D net_query("querynet.txt", "targetnet.txt", "nodesim.txt", query.type=3)
## End(Not run)


## Not run: 
##D ## Batch example
##D net_query_batch(c("querynet.txt", "querynet2.txt"),
##D   "targetnet.txt", "nodesim.txt", query.type=3)
## End(Not run)




