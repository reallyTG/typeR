library(interventionalDBN)


### Name: warshall
### Title: Find the largest edge probability threshold that connects a pair
###   of nodes.
### Aliases: warshall

### ** Examples

M1<-rbind(c(0.5,1,0),c(0,0,1),c(0,0,0))# A->B->C
warshall(M1)# A is upstream of B and C, B is upstream of C.
# Note that A is upstream of itself iff there is a cycle.

M2<-matrix(runif(25),5,5)
warshall(M2)



