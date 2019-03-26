library(NetworkToolbox)


### Name: comm.close
### Title: Community Closeness Centrality
### Aliases: comm.close

### ** Examples

A <- TMFG(neoOpen)$A

comm <- igraph::walktrap.community(convert2igraph(abs(A)))$membership

#Weighted
result <- comm.close(A, comm)

#Unweighted
result <- comm.close(A, comm, weighted = FALSE)




