library(d3Network)


### Name: d3Sankey
### Title: Create a D3 JavaScript Sankey diagram
### Aliases: d3Sankey

### ** Examples

## Not run: 
##D # Recreate Bostock Sankey diagram: http://bost.ocks.org/mike/sankey/
##D # Load energy projection data
##D library(RCurl)
##D URL <- "https://raw.githubusercontent.com/christophergandrud/d3Network/sankey/JSONdata/energy.json"
##D Energy <- getURL(URL, ssl.verifypeer = FALSE)
##D # Convert to data frame
##D EngLinks <- JSONtoDF(jsonStr = Energy, array = "links")
##D EngNodes <- JSONtoDF(jsonStr = Energy, array = "nodes")
##D 
##D # Plot
##D d3Sankey(Links = EngLinks, Nodes = EngNodes, Source = "source",
##D          Target = "target", Value = "value", NodeID = "name",
##D          fontsize = 12, nodeWidth = 30, file = "~/Desktop/TestSankey.html")
## End(Not run)



