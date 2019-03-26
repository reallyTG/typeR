library(wsyn)


### Name: cluseigen
### Title: Community structure detection in networks
### Aliases: cluseigen

### ** Examples

adj<-matrix(0, 10, 10) # create a fake adjacency matrix
adj[lower.tri(adj)]<-runif(10*9/2, -1, 1)
adj<-adj+t(adj)
colnames(adj)<-letters[1:10]
z<-cluseigen(adj)




