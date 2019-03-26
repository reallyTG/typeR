library(network)


### Name: as.matrix.network
### Title: Coerce a Network Object to Matrix Form
### Aliases: as.matrix.network as.matrix.network.adjacency
###   as.matrix.network.incidence as.matrix.network.edgelist
### Keywords: classes graphs

### ** Examples

#Create a random network
m <- matrix(rbinom(25,1,0.5),5,5)
diag(m) <- 0
g <- network(m)

#Coerce to matrix form
as.matrix.network(g,matrix.type="adjacency")
as.matrix.network(g,matrix.type="incidence")
as.matrix.network(g,matrix.type="edgelist")

#Can also use the extraction operator
g[,]                            #Get entire adjacency matrix
g[1:5,6:10]                     #Obtain a submatrix



