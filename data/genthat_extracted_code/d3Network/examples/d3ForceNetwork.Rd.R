library(d3Network)


### Name: d3ForceNetwork
### Title: Create a D3 JavaScript force directed network graph.
### Aliases: d3ForceNetwork

### ** Examples

#### Tabular data example.
# Load data
data(MisLinks)
data(MisNodes)

# Create graph
d3ForceNetwork(Links = MisLinks, Nodes = MisNodes, Source = "source",
               Target = "target", Value = "value", NodeID = "name",
               Group = "group", opacity = 0.4)

## Not run: 
##D #### JSON Data Example
##D # Load data JSON formated data into two R data frames
##D library(RCurl)
##D MisJson <- getURL("http://bit.ly/1cc3anB")
##D MisLinks <- JSONtoDF(jsonStr = MisJson, array = "links")
##D MisNodes <- JSONtoDF(jsonStr = MisJson, array = "nodes")
##D 
##D # Create graph
##D d3ForceNetwork(Links = MisLinks, Nodes = MisNodes, Source = "source",
##D                Target = "target", Value = "value", NodeID = "name",
##D                Group = "group", opacity = 0.4)
## End(Not run)



