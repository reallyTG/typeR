library(wsyn)


### Name: modularity
### Title: Modularity of a community structure of a graph
### Aliases: modularity

### ** Examples

adj<-matrix(0, 10, 10) # create a fake adjacency matrix
adj[lower.tri(adj)]<-runif(10*9/2, -1, 1)
adj<-adj+t(adj)
colnames(adj)<-letters[1:10]
m<-cluseigen(adj)
z<-modularity(adj, m[[length(m)]], decomp=TRUE)




