library(networkD3)


### Name: dendroNetwork
### Title: Create hierarchical cluster network diagrams.
### Aliases: dendroNetwork

### ** Examples

## Not run: 
##D hc <- hclust(dist(USArrests), "ave")
##D 
##D dendroNetwork(hc, height = 600)
##D dendroNetwork(hc, treeOrientation = "vertical")
##D 
##D dendroNetwork(hc, height = 600, linkType = "diagonal")
##D dendroNetwork(hc, treeOrientation = "vertical", linkType = "diagonal")
##D 
##D dendroNetwork(hc, textColour = c("red", "green", "orange")[cutree(hc, 3)],
##D                height = 600)
##D dendroNetwork(hc, textColour = c("red", "green", "orange")[cutree(hc, 3)],
##D                treeOrientation = "vertical")
## End(Not run)




