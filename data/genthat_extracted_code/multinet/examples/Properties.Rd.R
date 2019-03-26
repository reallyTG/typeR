library(multinet)


### Name: Network management: properties
### Title: Listing network properties
### Aliases: 'Network management: properties' actors.ml layers.ml
###   vertices.ml edges.ml edges.idx.ml num.actors.ml num.layers.ml
###   num.vertices.ml num.edges.ml nodes.ml num.nodes.ml

### ** Examples

net <- ml.aucs()
actors.ml(net)
layers.ml(net)
vertices.ml(net)
# only vertices in the "facebook" layer
vertices.ml(net,"facebook")
# all edges
edges.ml(net)
# Only edges inside the "lunch" layer
edges.ml(net,"lunch","lunch")
# Does the same as in the previous line
edges.ml(net,"lunch")
# Returns an empty  data frame, because there are no edges from the
# "lunch" layer to the "facebook" layer
edges.ml(net,"lunch","facebook")

num.actors.ml(net)
num.layers.ml(net)
num.vertices.ml(net)
# Only vertices in the "facebook" layer are counted
num.vertices.ml(net,"facebook")
num.edges.ml(net)
# Only edges inside the "lunch" layer are counted
num.edges.ml(net,"lunch","lunch")
# Does the same as in the previous line
num.edges.ml(net,"lunch")
# Returns 0, because there are no edges from the "lunch" layer to
# the "facebook" layer
num.edges.ml(net,"lunch","facebook")



