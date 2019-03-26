library(NetworkToolbox)


### Name: comm.eigen
### Title: Community Eigenvector Centrality
### Aliases: comm.eigen

### ** Examples

A <- TMFG(neoOpen)$A

comm <- igraph::walktrap.community(convert2igraph(abs(A)))$membership

result <- comm.eigen(A, comm)




