library(networkD3)


### Name: as.radialNetwork
### Title: Convert an R hclust or dendrogram object into a radialNetwork
###   list.
### Aliases: as.radialNetwork

### ** Examples

# Create a hierarchical cluster object and display with radialNetwork
## dontrun
hc <- hclust(dist(USArrests), "ave")
radialNetwork(as.radialNetwork(hc))




