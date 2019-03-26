library(NetworkToolbox)


### Name: comm.str
### Title: Community Strength/Degree Centrality
### Aliases: comm.str

### ** Examples

A <- TMFG(neoOpen)$A

comm <- igraph::walktrap.community(convert2igraph(abs(A)))$membership

#Strength
result <- comm.str(A, comm)

#Degree
result <- comm.str(A, comm, weighted = FALSE)




