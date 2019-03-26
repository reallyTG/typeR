library(dodgr)


### Name: dodgr_flowmap
### Title: dodgr_flowmap
### Aliases: dodgr_flowmap

### ** Examples

graph <- weight_streetnet (hampi)
from <- sample (graph$from_id, size = 10)
to <- sample (graph$to_id, size = 5)
to <- to [!to %in% from]
flows <- matrix (10 * runif (length (from) * length (to)),
                 nrow = length (from))
graph <- dodgr_flows_aggregate (graph, from = from, to = to, flows = flows)
# graph then has an additonal 'flows` column of aggregate flows along all
# edges. These flows are directed, and can be aggregated to equivalent
# undirected flows on an equivalent undirected graph with:
graph_undir <- merge_directed_flows (graph)
## Not run: 
##D dodgr_flowmap (graph_undir)
## End(Not run)



