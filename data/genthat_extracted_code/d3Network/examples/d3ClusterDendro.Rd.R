library(d3Network)


### Name: d3ClusterDendro
### Title: Create a D3 JavaScript Cluster Dendrogram graphs.
### Aliases: d3ClusterDendro

### ** Examples

## Not run: 
##D # Download JSON data
##D library(RCurl)
##D URL <- "https://raw.github.com/christophergandrud/d3Network/master/JSONdata/flare.json"
##D Flare <- getURL(URL)
##D 
##D # Convert to list format
##D Flare <- rjson::fromJSON(Flare)
##D 
##D # Recreate Bostock example from http://bl.ocks.org/mbostock/4063570
##D d3ClusterDendro(List = Flare,
##D 					file = "FlareCluster.html", zoom = TRUE,
##D      			fontsize = 10, opacity = 0.9,
##D      			widthCollapse = 0.8)
## End(Not run)



