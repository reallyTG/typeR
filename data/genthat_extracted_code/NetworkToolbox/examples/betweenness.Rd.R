library(NetworkToolbox)


### Name: betweenness
### Title: Betwenness Centrality
### Aliases: betweenness

### ** Examples

A <- TMFG(neoOpen)$A

#Weighted BC
BCw <- betweenness(A)

#Unweighted BC
BC <- betweenness(A, weighted = FALSE)




