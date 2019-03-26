library(NetworkToolbox)


### Name: eigenvector
### Title: Eigenvector Centrality
### Aliases: eigenvector

### ** Examples

A <- TMFG(neoOpen)$A

#Weighted
EC <- eigenvector(A)

#Unweighted 
EC <- eigenvector(A, weighted = FALSE)




