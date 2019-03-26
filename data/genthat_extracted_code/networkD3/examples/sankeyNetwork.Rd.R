library(networkD3)


### Name: sankeyNetwork
### Title: Create a D3 JavaScript Sankey diagram
### Aliases: sankeyNetwork

### ** Examples

## Not run: 
##D # Recreate Bostock Sankey diagram: http://bost.ocks.org/mike/sankey/
##D # Load energy projection data
##D URL <- paste0('https://cdn.rawgit.com/christophergandrud/networkD3/',
##D               'master/JSONdata/energy.json')
##D energy <- jsonlite::fromJSON(URL)
##D 
##D # Plot
##D sankeyNetwork(Links = energy$links, Nodes = energy$nodes, Source = 'source',
##D              Target = 'target', Value = 'value', NodeID = 'name',
##D              units = 'TWh', fontSize = 12, nodeWidth = 30)
##D 
##D # Colour links
##D energy$links$energy_type <- sub(' .*', '',
##D                                energy$nodes[energy$links$source + 1, 'name'])
##D 
##D sankeyNetwork(Links = energy$links, Nodes = energy$nodes, Source = 'source',
##D              Target = 'target', Value = 'value', NodeID = 'name',
##D              LinkGroup = 'energy_type', NodeGroup = NULL)
##D 
## End(Not run)



