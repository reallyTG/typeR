library(DirectedClustering)


### Name: ClustBCG
### Title: Clustering Coefficient for Directed/Undirected and Weighted
###   Networks (Barrat et al. (2004) and Clemente, Grassi (2018)
###   coefficients).
### Aliases: ClustBCG

### ** Examples

library(igraph)
#Generate a Weighted and Undirected graph with Erdos Renyi Model
gsim<-erdos.renyi.game(50, 0.5, type="gnp", directed = FALSE, loops = FALSE)
PESI<-runif(length(E(gsim)), 0, 1)
E(gsim)$weight<-PESI

#Get Adjacency
A<-get.adjacency(gsim, sparse=FALSE, attr="weight")
#Compute Barrat et al. (2004) coefficient
BarratClust<-ClustBCG(A, "undirected")

#The same results can be obtained with igraph::transitivity
check<-sum(BarratClust$LocalCC-transitivity(gsim, "weighted"))

#Generate a Weighted and Directed Graph with Erdos Renyi Model
gsim<-erdos.renyi.game(50, 0.5, type="gnp", directed = TRUE, loops = FALSE)
PESI<-runif(length(E(gsim)), 0, 1)
E(gsim)$weight<-PESI

#Get Adjacency
A<-get.adjacency(gsim, sparse=FALSE, attr="weight")

#Compute Clemente, Grassi (2018) coefficient
CGClust<-ClustBCG(A, "directed")



