library(Libra)


### Name: ising
### Title: Linearized Bregman solver for composite conditionally likelihood
###   of Ising model with lasso penalty.
### Aliases: ising
### Keywords: regression

### ** Examples


library('Libra')
library('igraph')
data('west10')
X <- as.matrix(2*west10-1);
obj = ising(X,10,0.1,nt=1000,trate=100)
g<-graph.adjacency(obj$path[,,770],mode="undirected",weighted=TRUE)
E(g)[E(g)$weight<0]$color<-"red"
E(g)[E(g)$weight>0]$color<-"green"
V(g)$name<-attributes(west10)$names
plot(g,vertex.shape="rectangle",vertex.size=35,vertex.label=V(g)$name,
edge.width=2*abs(E(g)$weight),main="Ising Model (LB): sparsity=0.51")



