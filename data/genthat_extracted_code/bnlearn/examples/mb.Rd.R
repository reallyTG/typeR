library(bnlearn)


### Name: misc utilities
### Title: Miscellaneous utilities
### Aliases: 'misc utilities' mb nbr arcs arcs<- directed.arcs
###   undirected.arcs incoming.arcs outgoing.arcs incident.arcs
###   compelled.arcs reversible.arcs narcs nnodes nodes nodes,bn-method
###   nodes,bn.fit-method nodes,bn.naive-method nodes,bn.tan-method nodes<-
###   nodes<-,bn-method nodes<-,bn.fit-method nodes<-,bn.naive-method
###   nodes<-,bn.tan-method amat amat<- parents parents<- children
###   children<- spouses ancestors descendants in.degree out.degree degree
###   degree,bn-method degree,bn.fit-method degree,bn.naive-method
###   degree,bn.tan-method root.nodes leaf.nodes nparams ntests whitelist
###   blacklist
### Keywords: convenience functions graphs

### ** Examples

data(learning.test)
res = gs(learning.test)

##  the Markov blanket of A.
mb(res, "A")
## the neighbourhood of F.
nbr(res, "F")
## the arcs in the graph.
arcs(res)
## the nodes of the graph.
nodes(res)
## the adjacency matrix for the nodes of the graph.
amat(res)
## the parents of D.
parents(res, "D")
## the children of A.
children(res, "A")
## the root nodes of the graph.
root.nodes(res)
## the leaf nodes of the graph.
leaf.nodes(res)
## number of parameters of the Bayesian network.
res = set.arc(res, "A", "B")
nparams(res, learning.test)



