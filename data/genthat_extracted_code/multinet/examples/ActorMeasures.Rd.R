library(multinet)


### Name: Measures: basic
### Title: Network analysis measures
### Aliases: 'Measures: basic' degree.ml degree.deviation.ml
###   neighborhood.ml xneighborhood.ml connective.redundancy.ml
###   relevance.ml xrelevance.ml

### ** Examples

net <- ml.aucs()
# degrees of all actors, considering edges on all layers
degree.ml(net)
# degree of actors U54 and U3, only considering layers work and coauthor
degree.ml(net,c("U54","U3"),c("work","coauthor"),"in")
# an indication of whether U54 and U3 are selectively active only on some layers
degree.deviation.ml(net,c("U54","U3"))
# co-workers of U54
neighborhood.ml(net,"U54","work")
# co-workers of U54 who are not connected to U54 on other layers
xneighborhood.ml(net,"U54","work")
# percentage of neighbors of U54 who are also co-workers
relevance.ml(net,"U54","work")
# redundancy between work and lunch
connective.redundancy.ml(net,"U54",c("work","lunch"))
# percentage of neighbors of U54 who would no longer
# be neighbors by removing this layer
xrelevance.ml(net,"U54","work")



