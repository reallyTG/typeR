library(dodgr)


### Name: dodgr_flows_aggregate
### Title: dodgr_flows_aggregate
### Aliases: dodgr_flows_aggregate

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
# This graph will only include those edges having non-zero flows, and so:
nrow (graph); nrow (graph_undir) # the latter is much smaller

# The following code can be used to convert the resultant graph to an `sf`
# object suitable for plotting
## Not run: 
##D geoms <- dodgr_to_sfc (graph_undir)
##D gc <- dodgr_contract_graph (graph_undir)
##D gsf <- sf::st_sf (geoms)
##D gsf$flow <- gc$graph$flow
##D 
##D # example of plotting with the 'mapview' package
##D library (mapview)
##D flow <- gsf$flow / max (gsf$flow)
##D ncols <- 30
##D cols <- colorRampPalette (c ("lawngreen", "red")) (ncols) [ceiling (ncols * flow)]
##D mapview (gsf, color = cols, lwd = 10 * flow)
## End(Not run)

# An example of flow aggregation across a generic (non-OSM) highway,
# represented as the `routes_fast` object of the \pkg{stplanr} package,
# which is a SpatialLinesDataFrame containing commuter densities along
# components of a street network.
## Not run: 
##D library (stplanr)
##D # merge all of the 'routes_fast' lines into a single network
##D r <- overline (routes_fast, attrib = "length", buff_dist = 1)
##D r <- sf::st_as_sf (r)
##D # then extract the start and end points of each of the original 'routes_fast'
##D # lines and use these for routing with `dodgr`
##D l <- lapply (routes_fast@lines, function (i)
##D              c (sp::coordinates (i) [[1]] [1, ],
##D                 tail (sp::coordinates (i) [[1]], 1)))
##D l <- do.call (rbind, l)
##D xy_start <- l [, 1:2]
##D xy_end <- l [, 3:4]
##D # Then just specify a generic OD matrix with uniform values of 1:
##D flows <- matrix (1, nrow = nrow (l), ncol = nrow (l))
##D # We need to specify both a `type` and `id` column for the
##D # weight_streetnet function.
##D r$type <- 1
##D r$id <- seq (nrow (r))
##D graph <- weight_streetnet (r, type_col = "type", id_col = "id",
##D                            wt_profile = 1)
##D f <- dodgr_flows_aggregate (graph, from = xy_start, to = xy_end, flows = flows)
##D # Then merge directed flows and convert to \pkg{sf} for plotting as before:
##D f <- merge_directed_flows (f)
##D geoms <- dodgr_to_sfc (f)
##D gc <- dodgr_contract_graph (f)
##D gsf <- sf::st_sf (geoms)
##D gsf$flow <- gc$graph$flow
##D # sf plot:
##D plot (gsf ["flow"])
## End(Not run)



