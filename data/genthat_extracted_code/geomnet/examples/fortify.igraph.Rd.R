library(geomnet)


### Name: fortify.igraph
### Title: Function for converting an igraph object into the correct format
###   for use with geomnet
### Aliases: fortify.igraph

### ** Examples

# class igraph (igraph, igraphdata packages)
library(igraph)
data(blood, package = "geomnet")
blood.igraph <- graph_from_data_frame(d = blood$edges, 
   directed = TRUE, vertices = unique(blood$vertices[, 1:3]))
fortify(blood.igraph)




