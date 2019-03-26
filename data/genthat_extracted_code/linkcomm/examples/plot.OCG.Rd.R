library(linkcomm)


### Name: plot.OCG
### Title: The 'OCG' Plotting Function
### Aliases: plot.OCG

### ** Examples

## Generate graph and extract OCG communities.
g <- swiss[,3:4]
oc <- getOCG.clusters(g)

## Plot a graph of OCG clusters.
plot(oc, type = "graph")



