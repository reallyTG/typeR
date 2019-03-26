library(DirectedClustering)


### Name: ClustF
### Title: Clustering Coefficients for Directed/Undirected and Weighted
###   Networks (Onnela et al. (2005) and Fagiolo (2007) coefficients)
### Aliases: ClustF
### Keywords: graphs

### ** Examples

library(igraph)
#Generate a Weighted and Undirected graph with Erdos Renyi Model
gsim<-erdos.renyi.game(50, 0.5, type="gnp", directed = FALSE, loops = FALSE)
PESI<-runif(length(E(gsim)), 0, 1)
E(gsim)$weight<-PESI

#Get Adjacency
A<-get.adjacency(gsim, sparse=FALSE, attr="weight")

#Compute Onnela et al. (2005) coefficient
OnnelaClust<-ClustF(A, "undirected")

#Generate a Weighted and Directed Graph with Erdos Renyi Model
gsim<-erdos.renyi.game(50, 0.5, type="gnp", directed = TRUE, loops = FALSE)
PESI<-runif(length(E(gsim)), 0, 1)
E(gsim)$weight<-PESI

#Get Adjacency
A<-get.adjacency(gsim, sparse=FALSE, attr="weight")

#Compute Fagiolo (2007) coefficient
FagioloClust<-ClustF(A, "directed")




