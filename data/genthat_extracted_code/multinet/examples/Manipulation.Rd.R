library(multinet)


### Name: Network management: updates
### Title: Manipulation of multilayer networks
### Aliases: 'Network management: updates' add.layers.ml add.actors.ml
###   add.vertices.ml add.edges.ml add.igraph.layer.ml delete.layers.ml
###   delete.actors.ml delete.vertices.ml delete.edges.ml add.nodes.ml
###   delete.nodes.ml

### ** Examples

net <- ml.empty()
# Adding some layers
add.layers.ml(net,"l1")
add.layers.ml(net,c("l2","l3"),c(TRUE,FALSE))
layers.ml(net)
# Adding actors A1, A2, A3
add.actors.ml(net,"A1")
add.actors.ml(net,c("A2","A3"))
# Verifying that the actors have been added correctly
num.actors.ml(net)
actors.ml(net)
# Adding some vertices (actor A3 is not present in layer l3: no corresponding vertex there)
vertices <- data.frame(
    c("A1","A2","A3","A1","A2","A3"),
    c("l1","l1","l1","l2","l2","l2"))
add.vertices.ml(net,vertices)
vertices <- data.frame(
    c("A1","A2"),
    c("l3","l3"))
add.vertices.ml(net,vertices)
vertices.ml(net)
# We create a data frame specifying two edges:
# A2,l2 -- A3,l1
# A2,l2 -- A3,l2
edges <- data.frame(
    c("A2","A2"),
    c("l2","l2"),
    c("A3","A3"),
    c("l1","l2"))
add.edges.ml(net,edges)
edges.ml(net)

# The following deletes layer 1, ans also deletes
# all vertices from "l1" and the edge with an end-point in "l1"
delete.layers.ml(net,"l1")
# The following also deletes the vertices associated to
# "A1" in layers "l2" and "l3"
delete.actors.ml(net,"A1")
# deleting vertex A2,l3 and edge A2,l2 -- A3,l2
delete.vertices.ml(net,data.frame("A2","l3"))
edges <- data.frame("A2","l2","A3","l2")
delete.edges.ml(net,edges)
net



