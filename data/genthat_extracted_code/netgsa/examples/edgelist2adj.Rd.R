library(netgsa)


### Name: edgelist2adj
### Title: Construct an adjacency matrix from an edge list
### Aliases: edgelist2adj

### ** Examples

#Read the data
data(edgelist)
data(nonedgelist)

#Generate the .txt files
write.table(edgelist, file="edgelist.txt", row.names=FALSE)
write.table(nonedgelist, file="nonedgelist.txt", row.names=FALSE)

#Read the edge/nonedge list from files
oneMat = edgelist2adj(file="edgelist.txt", vertex.names=paste0("gene", 1:100), 
         mode="undirected")
zeroMat = edgelist2adj(file="nonedgelist.txt", vertex.names=paste0("gene", 1:100), 
          mode="undirected")



