library(network)


### Name: as.network.matrix
### Title: Coercion from Matrices to Network Objects
### Aliases: as.network.matrix as.network.default
### Keywords: classes graphs

### ** Examples

#Draw a random matrix
m<-matrix(rbinom(25,1,0.5),5)
diag(m)<-0

#Coerce to network form
g<-as.network.matrix(m,matrix.type="adjacency")

# edge list example. Only 4 nodes in the edge list.
m = matrix(c(1,2, 2,3, 3,4), byrow = TRUE, nrow=3)
attr(m, 'n') = 7
as.network(m, matrix.type='edgelist')



