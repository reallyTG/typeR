library(linkcomm)


### Name: plotOCGraph
### Title: Plot a Graph Layout of OCG Communities
### Aliases: plotOCGraph

### ** Examples

## Generate graph and extract OCG communities.
g <- swiss[,3:4]
oc <- getOCG.clusters(g)

## Plot a graph of OCG communities.
plot(oc, type = "graph")



