library(dodgr)


### Name: dodgr_distances
### Title: dodgr_distances
### Aliases: dodgr_distances

### ** Examples

# A simple graph
graph <- data.frame (from = c ("A", "B", "B", "B", "C", "C", "D", "D"),
                     to = c ("B", "A", "C", "D", "B", "D", "C", "A"),
                     d = c (1, 2, 1, 3, 2, 1, 2, 1))
dodgr_dists (graph)

# A larger example from the included [hampi()] data.
graph <- weight_streetnet (hampi)
from <- sample (graph$from_id, size = 100)
to <- sample (graph$to_id, size = 50)
d <- dodgr_dists (graph, from = from, to = to)
# d is a 100-by-50 matrix of distances between `from` and `to`

## Not run: 
##D # a more complex street network example, thanks to @chrijo; see
##D # https://github.com/ATFutures/dodgr/issues/47
##D 
##D xy <- rbind (c (7.005994, 51.45774), # limbeckerplatz 1 essen germany
##D              c (7.012874, 51.45041)) # hauptbahnhof essen germany
##D xy <- data.frame (lon = xy [, 1], lat = xy [, 2])
##D essen <- dodgr_streetnet (pts = xy, expand = 0.2, quiet = FALSE)
##D graph <- weight_streetnet (essen, wt_profile = "foot")
##D d <- dodgr_dists (graph, from = xy, to = xy)
##D # First reason why this does not work is because the graph has multiple,
##D # disconnected components.
##D table (graph$component)
##D # reduce to largest connected component, which is always number 1
##D graph <- graph [which (graph$component == 1), ]
##D d <- dodgr_dists (graph, from = xy, to = xy)
##D # should work, but even then note that
##D table (essen$level)
##D # There are parts of the network on different building levels (because of
##D # shopping malls and the like). These may or may not be connected, so it may be
##D # necessary to filter out particular levels
##D levs <- paste0 (essen$level) # because sf data are factors
##D index <- which (! (levs == "-1" | levs == "1")) # for example
##D library (sf) # needed for following sub-select operation
##D essen <- essen [index, ]
##D graph <- weight_streetnet (essen, wt_profile = "foot")
##D d <- dodgr_dists (graph, from = xy, to = xy)
## End(Not run)



