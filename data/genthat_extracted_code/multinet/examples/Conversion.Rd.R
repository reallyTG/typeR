library(multinet)


### Name: Conversion
### Title: Conversion to a simple or multi graph
### Aliases: Conversion as.igraph.Rcpp_RMLNetwork

### ** Examples

net <- ml.aucs()
# using the default merge.actors=TRUE we create a multigraph,
# where each actor corresponds to a node in the result
multigraph <- as.igraph(net)
# this is a simple graph corresponding to the facebook layer
facebook1 <- as.igraph(net, "facebook")
# this includes also the actors without a facebook account
facebook2 <- as.igraph(net, "facebook", all.actors=TRUE)
# two layers are converted to an igraph object, where two
# nodes are used for each actor: one corresponding to the
# node on facebook, one to the node on lunch
f_l_net <- as.igraph(net, c("facebook","lunch"),
    merge.actors=FALSE)



