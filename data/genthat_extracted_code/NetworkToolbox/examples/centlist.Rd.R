library(NetworkToolbox)


### Name: centlist
### Title: List of Centrality Measures
### Aliases: centlist

### ** Examples

A <- TMFG(neoOpen)$A

#Weighted
centW <- centlist(A, weighted = TRUE)

#Unweighted
centU <- centlist(A, weighted = FALSE)




