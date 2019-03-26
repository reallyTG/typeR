library(network)


### Name: which.matrix.type
### Title: Heuristic Determination of Matrix Types for Network Storage
### Aliases: which.matrix.type
### Keywords: graphs

### ** Examples

  #Create an arbitrary adjacency matrix
  m<-matrix(rbinom(25,1,0.5),5,5)
  diag(m)<-0

  #Can we guess the type?
  which.matrix.type(m)

  #Try the same thing with a network
  g<-network(m)
  which.matrix.type(g)
  which.matrix.type(as.matrix.network(g,matrix.type="incidence"))
  which.matrix.type(as.matrix.network(g,matrix.type="edgelist"))



