library(networkD3)


### Name: igraph_to_networkD3
### Title: Function to convert igraph graph to a list suitable for
###   networkD3
### Aliases: igraph_to_networkD3

### ** Examples

# Load igraph
library(igraph)

# Use igraph to make the graph and find membership
karate <- make_graph("Zachary")
wc <- cluster_walktrap(karate)
members <- membership(wc)

# Convert to object suitable for networkD3
karate_d3 <- igraph_to_networkD3(karate, group = members)

# Create force directed network plot
forceNetwork(Links = karate_d3$links, Nodes = karate_d3$nodes,
             Source = 'source', Target = 'target', NodeID = 'name',
             Group = 'group')

## Not run: 
##D # Example with data from data frame
##D # Load data
##D ## Original data from http://results.ref.ac.uk/DownloadSubmissions/ByUoa/21
##D data('SchoolsJournals')
##D 
##D # Convert to igraph
##D SchoolsJournals <- graph.data.frame(SchoolsJournals, directed = FALSE)
##D 
##D # Remove duplicate edges
##D SchoolsJournals <- simplify(SchoolsJournals)
##D 
##D # Find group membership
##D wt <- cluster_walktrap(SchoolsJournals, steps = 6)
##D members <- membership(wt)
##D 
##D # Convert igraph to list for networkD3
##D sj_list <- igraph_to_networkD3(SchoolsJournals, group = members)
##D 
##D # Plot as a forceDirected Network
##D forceNetwork(Links = sj_list$links, Nodes = sj_list$nodes, Source = 'source',
##D              Target = 'target', NodeID = 'name', Group = 'group',
##D              zoom = TRUE, linkDistance = 200)
## End(Not run)




