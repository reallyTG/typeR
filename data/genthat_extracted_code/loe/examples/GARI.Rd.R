library(loe)


### Name: GARI
### Title: Graph Adjusted Rand Index
### Aliases: GARI

### ** Examples

library(igraph)
###########
#Based on the distance matrix of an embedding, 
#this function provides the recovered adjacency matrix for given number of nearest neighbors.
###########
rec.graph <- function(DM, k, symm =FALSE, weight=FALSE ) {
N <- nrow(DM)
ADM <- matrix(0, N, N)
#Search kNN point
if(weight==TRUE){
 for (i in 1:N) {
  nid <- order(DM[i,])
  ADM[ i, nid[2:(k[i]+1)] ] <- DM[ i, nid[2:(k[i]+1)] ]
 }
}else{
 for (i in 1:N) {
  nid <- order(DM[i,])
  ADM[i,nid[2:(k[i]+1)] ] <- 1
 }
}
if(symm==TRUE){
 SADM <- ADM+t(ADM)
 SADM[SADM==2*ADM] <- ADM[SADM==2*ADM]
 ADM <- SADM
}
return(ADM)
}
						

ADM <- as.matrix( get.adjacency(graph.famous("Thomassen")) )
#Apply LOE
result.LOE <- LOE(ADM=ADM,p=2,c=0.1,method="BFGS",report=1000)

#Compute the vector of numbers of nearest neighbors with each verteces
true.nn <- apply(X=ADM,1,sum)

#Reconstracte the adjacency matrix based on the result embedding
EDM <- as.matrix( dist(result.LOE$X) )
EADM <- rec.graph(EDM,k=true.nn )

#Compute GARI between ADM and EADM
GARI(ADM,EADM)



